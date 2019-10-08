// Copyright 2019 Markus Winter
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Foundation
import SIMDX

// A non-resizable mutable, random access collection, that defines vector spaces of different cardinality by the
// `count` of it. It is backed by a `RawVector` and described, when orthogonal projected, by `Scalar` values.
public protocol Vector: RawRepresentable, RandomAccessCollection, MutableCollection, ExpressibleByArrayLiteral
where ArrayLiteralElement == Element, Element == RawValue.Element, Index == RawValue.Index {

    /// A vector collection is described by scalar values
    associatedtype Scalar where Scalar == Element

    /// The components of the vector when orthogonal projected into a coordinate system of same cardinality.
    ///
    /// Examples:
    ///  - (x,y) in 2D
    ///  - (x,y,z) in 3D
    ///  - (x,y,z,w) in 4D
    associatedtype OrthogonalProjection where OrthogonalProjection: Projection, OrthogonalProjection.Storage == RawValue

    /// The components of the vector in an orthogonal projection
    var projection: OrthogonalProjection { get }

    //    associatedtype Magnitude
    //    var magnitude: Magnitude { get }
    //    var direction: Element { get }

    /// The raw value storage of the vector
    var rawValue: RawValue { get set } // Diff to RawRepresentable: Mutable

    /// Inititializes a new vector to given rawValue storage.
    /// - Parameter rawValue: The rawValue storage to back this vector
    init(rawValue: RawValue) // Diff to RawRepresentable: None-failable initializer
}

// MARK: - Common
extension Vector {

    // MARK: Designated Initializer

    /// Initialize to a vector with all components at `projectedScalar` value.
    @inlinable public init(repeating projectedScalar: Element) {
        self.init(rawValue: .init(repeating: projectedScalar))
    }

    /// Initialize to a vector with projected values equal to values in the sequence.
    ///
    /// - Precondition: The sequence must be of same count (cardinality) as the vector.
    init<Other>(sequence: Other) where Other: Sequence, Other.Element == Self.Element {
        self.init(rawValue: .init(other: sequence))
    }

    // MARK: Projection

    /// The components of the vector when orthogonal projected into a coordinate system of same cardinality.
    @inlinable public var projection: OrthogonalProjection { .init(on: rawValue) }
}

// MARK: - Collection
extension Vector {

    /// The position of the first element in the collection.
    @inlinable public var startIndex: Index { rawValue.startIndex }

    /// The collection's "past the end" position.
    /// That is, the position one greater than the last valid subscript argument.
    @inlinable public var endIndex: Index { rawValue.endIndex }

    /// Returns the position immediately before the given index.
    /// - Parameter index: A valid index of the collection. index must be greater than startIndex.
    @inlinable public func index(before index: Index) -> Index { rawValue.index(before: index) }

    /// Returns the position immediately after the given index.
    /// - Parameter index: A valid index of the collection. index must be less than endIndex.
    @inlinable public func index(after index: Index) -> Index { rawValue.index(after: index) }

    /// Allows read and write access to individual projected elements in the storage.
    @inlinable public subscript(position: Index) -> Scalar {
        @inlinable set { rawValue[position] = newValue }
        @inlinable get { rawValue[position] }
    }

    /// Creates an instance initialized with the given elements.
    @inlinable public init(arrayLiteral elements: Element...) {
        self.init(rawValue: RawValue.init(other: elements))
    }
}

// MARK: - The Numeric Road -

// MARK: Equatable
extension Vector where RawValue.Storage: EquatableStorage {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`, `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

// MARK: Additive Arithmetic
extension Vector where RawValue.Storage: AdditiveArithmeticStorage {

    /// The zero vector, i.e. the origin of the vector space
    @inlinable public static var zero: Self { .init(rawValue: .zero) }
}

//// MARK: - Equatable & Comparable
//
//extension VectorProtocol where RawValue: Comparable {
//
//    /// Returns a Boolean value indicating whether the value of the first
//    /// argument is less than that of the second argument.
//    ///
//    /// This function is the only requirement of the `Comparable` protocol. The
//    /// remainder of the relational operator functions are implemented by the
//    /// standard library for any type that conforms to `Comparable`.
//    ///
//    /// - Parameters:
//    ///   - lhs: A value to compare.
//    ///   - rhs: Another value to compare.
//    @inlinable public static func < (lhs: Self, rhs: Self) -> Bool {
//        return lhs.rawValue < rhs.rawValue
//    }
//}
//
//// MARK: - Arithmetic
//
//extension VectorProtocol where RawValue.Element: SignedNumeric {
//    /// Negation of `rhs`.
//    @inlinable public prefix static func - (rhs: Self) -> Self {
//        return .init(sequence: rhs.rawValue.map(-))
//    }
//}
//
//extension VectorProtocol where RawValue: AdditiveArithmetic {
//
//    /// Vector (elementwise) sum of `lhs` and `rhs`.
//    @inlinable public static func + (lhs: Self, rhs: Self) -> Self {
//        return .init(rawValue: lhs.rawValue + rhs.rawValue)
//    }
//
//    /// Vector (elementwise) difference of `lhs` and `rhs`.
//    @inlinable public static func - (lhs: Self, rhs: Self) -> Self {
//        return .init(rawValue: lhs.rawValue - rhs.rawValue)
//    }
//
//    /// Add `rhs` to `lhs`.
//    @inlinable public static func += (lhs: inout Self, rhs: Self) {
//        lhs.rawValue += rhs.rawValue
//    }
//
//    /// Subtract `rhs` from `lhs`.
//    @inlinable public static func -= (lhs: inout Self, rhs: Self) {
//        lhs.rawValue -= rhs.rawValue
//    }
//}
//
//extension VectorProtocol where RawValue: AdditiveOverflowArithmetic {
//
//    /// Negation of `rhs`.
//    @inlinable public prefix static func - (rhs: Self) -> Self {
//        return .init(rawValue: -rhs.rawValue)
//    }
//
//    /// Vector (elementwise) sum of `lhs` and `rhs`.
//    @inlinable public static func &+ (lhs: Self, rhs: Self) -> Self {
//        return .init(rawValue: lhs.rawValue &+ rhs.rawValue)
//    }
//
//    /// Vector (elementwise) difference of `lhs` and `rhs`.
//    @inlinable public static func &- (lhs: Self, rhs: Self) -> Self {
//        return .init(rawValue: lhs.rawValue &- rhs.rawValue)
//    }
//}
//
//extension VectorProtocol where Vector: MultiplicativeArithmetic {
//
//    /// Elementwise product of `lhs` and `rhs` (A.k.a. the Hadamard or Schur vector product).
//    @inlinable public static func * (lhs: Self, rhs: Self) -> Self {
//        return .init(rawValue: lhs.rawValue * rhs.rawValue)
//    }
//
//    /// Scalar-Vector product.
//    @inlinable public static func * (lhs: Vector.Scalar, rhs: Self) -> Self {
//        return .init(rawValue: lhs * rhs.rawValue)
//    }
//
//    /// Scalar-Vector product.
//    @inlinable public static func * (lhs: Self, rhs: Vector.Scalar) -> Self {
//        return .init(rawValue: lhs.rawVector * rhs)
//    }
//
//    /// Elementwise quotient of `lhs` and `rhs`.
//    @inlinable public static func / (lhs: Self, rhs: Self) -> Self {
//        return .init(rawValue: lhs.rawVector / rhs.rawVector)
//    }
//
//    /// Divide vector by scalar.
//    @inlinable public static func / (lhs: Self, rhs: Vector.Scalar) -> Self {
//        return .init(rawValue: lhs.rawVector / rhs)
//    }
//
//    /// Multiply `lhs` by `rhs` (elementwise).
//    @inlinable public static func *= (lhs: inout Self, rhs: Self) {
//        lhs.rawVector *= rhs.rawVector
//    }
//
//    /// Divide `lhs` by `rhs` (elementwise).
//    @inlinable public static func /= (lhs: inout Self, rhs: Self) {
//        lhs.rawVector /= rhs.rawVector
//    }
//
//    /// Scales `lhs` by `rhs`.
//    @inlinable public static func *= (lhs: inout Self, rhs: Vector.Scalar) {
//        lhs.rawVector *= rhs
//    }
//
//    /// Scales `lhs` by `1/rhs`.
//    @inlinable public static func /= (lhs: inout Self, rhs: Vector.Scalar) {
//        lhs.rawVector /= rhs
//    }
//}
//
//extension VectorProtocol where Vector: MultiplicativeOverflowArithmetic {
//
//    /// Elementwise product of `lhs` and `rhs` (A.k.a. the Hadamard or Schur vector product).
//    @inlinable public static func &* (lhs: Self, rhs: Self) -> Self {
//        return .init(rawValue: lhs.rawVector &* rhs.rawVector)
//    }
//
//    /// Scalar-Vector product.
//    @inlinable public static func &* (lhs: Vector.Scalar, rhs: Self) -> Self {
//        return .init(rawValue: lhs &* rhs.rawVector)
//    }
//
//    /// Scalar-Vector product.
//    @inlinable public static func &* (lhs: Self, rhs: Vector.Scalar) -> Self {
//        return .init(rawValue: lhs.rawVector &* rhs)
//    }
//
//    /// Elementwise quotient of `lhs` and `rhs`.
//    @inlinable public static func / (lhs: Self, rhs: Self) -> Self {
//        return .init(rawValue: lhs.rawVector / rhs.rawVector)
//    }
//
//    /// Divide vector by scalar.
//    @inlinable public static func / (lhs: Self, rhs: Vector.Scalar) -> Self {
//        return .init(rawValue: lhs.rawVector / rhs)
//    }
//
//    /// Divide `lhs` by `rhs` (elementwise).
//    @inlinable public static func /= (lhs: inout Self, rhs: Self) {
//        lhs.rawVector /= rhs.rawVector
//    }
//}
