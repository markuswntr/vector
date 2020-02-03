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

// A non-resizable mutable, random access collection, that defines vector spaces of different cardinality by the
// `count` of it. It is backed by a `RawVector` and described, when orthogonal projected, by `Scalar` values.
public protocol EuclideanVector: RandomAccessCollection, MutableCollection, RawRepresentable, ExpressibleByArrayLiteral where Index == Int {

    /// An euclidean vector is described by scalar values
    associatedtype Scalar where Scalar == Element, Scalar == RawValue.Scalar

    /// The components of the vector when orthogonal projected into a coordinate system of same cardinality.
    ///
    /// Examples:
    ///  - (x,y) in 2D
    ///  - (x,y,z) in 3D
    ///  - (x,y,z,w) in 4D
    associatedtype OrthogonalProjection where OrthogonalProjection: Projection, OrthogonalProjection.Storage == RawValue

    /// The components of the vector in an orthogonal projection
    var projection: OrthogonalProjection { get }

    /// The raw value storage of the vector
    var rawValue: RawValue { get set } // Diff to RawRepresentable: Mutable to inline mutating calls

    /// Inititializes a new vector to given rawValue storage.
    /// - Parameter rawValue: The rawValue storage to back this vector
    init(rawValue: RawValue) // Diff to RawRepresentable: None-failable initializer
}

// MARK: Collection & ExpressibleByArrayLiteral
extension EuclideanVector {

    /// The cardinality of the vector spaces, i.e. the count of components
    @inlinable public var count: Int { rawValue.scalarCount }

    /// The position of the first element in the collection.
    @inlinable public var startIndex: Index { 0 }

    /// The collection's "past the end" position.
    /// That is, the position one greater than the last valid subscript argument.
    @inlinable public var endIndex: Index { count }

    /// Allows read and write access to individual projected elements in the storage.
    @inlinable public subscript(position: Index) -> Scalar {
        @inlinable set { rawValue[position] = newValue }
        @inlinable get { rawValue[position] }
    }

    /// Creates a vector from specified projected elements.
    ///
    /// - Precondition: The sequence must be of same count (cardinality) as the vector.
    @inlinable init<Other>(sequence: Other) where Other: Sequence, Other.Element == Element {
        self.init(rawValue: .init(sequence))
    }

    /// Creates a vector from specified projected elements.
    ///
    /// - Parameter scalars: The elements to use in the vector. `scalars` must
    ///   have the same number of elements as the vector type.
    @inlinable public init(arrayLiteral scalars: Scalar...) {
        self.init(sequence: scalars)
    }
}

// MARK: Projection
extension EuclideanVector {

    /// The components of the vector when orthogonal projected into a coordinate system of same cardinality.
    @inlinable public var projection: OrthogonalProjection { .init(on: rawValue) }

    /// Initialize to a vector with all components at `projectedScalar` value.
    @inlinable public init(repeating projectedScalar: Scalar) {
        self.init(rawValue: .init(repeating: projectedScalar))
    }
}

// MARK: - The Numeric Road -

// MARK: Fixed Width Integer
extension EuclideanVector where Scalar: FixedWidthInteger { // TODO: SIMD limits spliting the protocol any further

    /// The zero vector, i.e. the origin of the vector space
    @inlinable public static var zero: Self { .init(rawValue: RawValue.zero) }

    /// Returns the elementwise sum of the two vectors.
    ///
    /// - Note: No integer overflow handling.
    @inlinable public static func &+ (lhs: Self, rhs: Self) -> Self {
        var lhs = lhs
        lhs.rawValue &+= rhs.rawValue
        return lhs
    }

    /// Returns the elementwise difference of the two vectors.
    ///
    /// - Note: No integer overflow handling.
    @inlinable public static func &- (lhs: Self, rhs: Self) -> Self {
        var lhs = lhs
        lhs.rawValue &-= rhs.rawValue
        return lhs
    }

    /// Scales the vector by given scalar factor (to multiply the vector with).
    ///
    /// - Note: No integer overflow handling.
    ///
    /// - Parameter factor: The scale factor to apply to vector.
    @inlinable public mutating func scale(by factor: Scalar) {
        rawValue &*= factor
    }

    /// Scales the vector by given scalar factor (to multiply the vector with) and returns the result.
    ///
    /// - Note: No integer overflow handling.
    ///
    /// - Parameter factor: The scale factor to apply to vector.
    @inlinable public func scaled(by factor: Scalar) -> Self {
        var result = self
        result.scale(by: factor)
        return result
    }

    /// Returns the elementwise scaled product of multiplying the vector by a factor.
    ///
    /// - Note: No integer overflow handling.
    @inlinable public static func &*= (lhs: inout Self, rhs: Scalar) {
        lhs.scale(by: rhs)
    }

    /// Returns the elementwise scaled product of multiplying the vector by a factor.
    ///
    /// - Note: No integer overflow handling.
    @inlinable public static func &* (lhs: Self, rhs: Scalar) -> Self {
        lhs.scaled(by: rhs)
    }

    /// The sum of the squares of the two vector values.
    ///
    /// The square root of this value is the magnitude of the vector.
    /// Use this value over the `magnitude` to compare the relative lengths of two vectors.
    ///
    /// - Note: No integer overflow handling.
    @inlinable func magnitudeSquared() -> Scalar {
        (rawValue &* rawValue).wrappedSum()
    }

    /// The magnitude, or the length, of the vector.
    ///
    /// Calculated as the square root of the sum of the squares of the two vector values.
    /// The accuracy is determined by the requested floating-point `Unit`.
    ///
    /// - Note: No integer overflow handling.
    @inlinable func magnitude<Unit>() -> Unit where Unit: FloatingPoint {
        sqrt(.init(magnitudeSquared()))
    }
}

// MARK: Floating Point
extension EuclideanVector where Scalar: FloatingPoint { // TODO: SIMD limits spliting the protocol any further

    /// The zero vector, i.e. the origin of the vector space
    @inlinable public static var zero: Self { .init(rawValue: RawValue.zero) }

    /// Returns the elementwise sum of the two vectors.
    @inlinable public static func += (lhs: inout Self, rhs: Self) {
        lhs.rawValue += rhs.rawValue
    }

    /// Returns the elementwise sum of the two vectors.
    @inlinable public static func + (lhs: Self, rhs: Self) -> Self {
        var lhs = lhs; lhs += rhs; return lhs
    }

    /// Returns the elementwise difference of the two vectors.
    @inlinable public static func -= (lhs: inout Self, rhs: Self) {
        lhs.rawValue -= rhs.rawValue
    }

    /// Returns the elementwise difference of the two vectors.
    @inlinable public static func - (lhs: Self, rhs: Self) -> Self {
        var lhs = lhs; lhs -= rhs; return lhs
    }

    /// Scales the vector by given scalar factor (to multiply the vector with).
    /// - Parameter factor: The scale factor to apply to vector.
    @inlinable public mutating func scale(by factor: Scalar) {
        rawValue *= factor
    }

    /// Scales the vector by given scalar factor (to multiply the vector with).
    /// - Parameter factor: The scale factor to apply to vector.
    @inlinable public func scaled(by factor: Scalar) -> Self {
        var result = self
        result.scale(by: factor)
        return result
    }

    /// Returns the elementwise scaled product of multiplying the vector by a factor.
    @inlinable public static func *= (lhs: inout Self, rhs: Scalar) {
        lhs.scale(by: rhs)
    }

    /// Returns the elementwise scaled product of multiplying the vector by a factor.
    @inlinable public static func * (lhs: Self, rhs: Scalar) -> Self {
        lhs.scaled(by: rhs)
    }

    /// Returns the elementwise scaled product of multiplying the vector by a factor.
    @inlinable public static func /= (lhs: inout Self, rhs: Scalar) {
        lhs.rawValue /= rhs
    }

    /// Returns the elementwise scaled product of multiplying the vector by a factor.
    @inlinable public static func / (lhs: Self, rhs: Scalar) -> Self {
        var lhs = lhs
        lhs.rawValue /= rhs
        return lhs
    }

    /// The sum of the squares of the two vector values.
    ///
    /// The square root of this value is the magnitude of the vector.
    /// Use this value over the `magnitude` to compare the relative lengths of two vectors.
    @inlinable func magnitudeSquared() -> Scalar {
        (rawValue * rawValue).sum()
    }

    /// The magnitude, or the length, of the vector.
    ///
    /// Calculated as the square root of the sum of the squares of the two vector values.
    @inlinable func magnitude() -> Scalar {
        magnitudeSquared().squareRoot()
    }

    /// Normalizes the vector to given magnitude.
    ///
    /// This operation changes only the magnitude of the vector but not its direction.
    /// If no further `magnitude` is specified the result will be a unit vector (a vector of length `1`).
    ///
    /// - Parameter magnitude: The new magnitude of the vector. Defaults to `1` (one).
    @inlinable public mutating func normalize(to magnitude: Scalar = 1) {
        rawValue /= magnitudeSquared().squareRoot()
        rawValue *= magnitude
    }

    /// Normalizes the vector to given magnitude and returns the result.
    ///
    /// This operation changes only the magnitude of the vector but not its direction.
    /// If no further `magnitude` is specified, this method returns the unit vector (a vector of length `1`).
    ///
    /// - Parameter magnitude: The new magnitude of the vector. Defaults to `1` (one).
    @inlinable public func normalized(to magnitude: Scalar = 1) -> Self {
        var result = self
        result.normalize(to: magnitude)
        return result
    }
}

// MARK: Equatable & Comparable & FixedWidthInteger
extension EuclideanVector where Scalar: Comparable & FixedWidthInteger {

    /// Returns a Boolean value indicating whether the magnitudes of the two vectors are equal.
    ///
    /// Equality is the inverse of inequality.
    /// For any values `a` and `b`, `a == b` implies that `a != b` is `false`.
    ///
    /// - Note:
    ///     This compares equalility of the **magnitude** of two vectors.
    ///     To compare projected `(x,y)` values, use `==` on the `projection` property.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.magnitudeSquared() == rhs.magnitudeSquared()
    }

    /// Returns a Boolean value indicating whether the magnitude of the first
    /// argument is less than that of the second argument.
    ///
    /// - Note: This compares the **magnitude**, or the length, of two vectors.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.magnitudeSquared() < rhs.magnitudeSquared()
    }

    /// Returns a Boolean value indicating whether the magnitude of the first argument
    /// is greater than that of the second argument.
    ///
    /// - Note: This compares the **magnitude**, or the length, of two vectors.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable public static func > (lhs: Self, rhs: Self) -> Bool {
        lhs.magnitudeSquared() > rhs.magnitudeSquared()
    }

    /// Returns a Boolean value indicating whether the magnitude of the first argument
    /// is less than or equal to that of the second argument.
    ///
    /// - Note: This compares the **magnitude**, or the length, of two vectors.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable public static func <= (lhs: Self, rhs: Self) -> Bool {
        lhs.magnitudeSquared() <= rhs.magnitudeSquared()
    }

    /// Returns a Boolean value indicating whether the magnitude of the first argument
    /// is greater than or equal to that of the second argument.
    ///
    /// - Note: This compares the **magnitude**, or the length, of two vectors.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare..
    @inlinable public static func >= (lhs: Self, rhs: Self) -> Bool {
        lhs.magnitudeSquared() >= rhs.magnitudeSquared()
    }
}

// MARK: Equatable & Comparable & FloatingPoint
extension EuclideanVector where Scalar: Comparable & FloatingPoint {

    /// Returns a Boolean value indicating whether the magnitudes of the two vectors are equal.
    ///
    /// Equality is the inverse of inequality.
    /// For any values `a` and `b`, `a == b` implies that `a != b` is `false`.
    ///
    /// - Note:
    ///     This compares equalility of the **magnitude** of two vectors.
    ///     To compare projected `(x,y)` values, use `==` on the `projection` property.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.magnitudeSquared() == rhs.magnitudeSquared()
    }

    /// Returns a Boolean value indicating whether the magnitude of the first
    /// argument is less than that of the second argument.
    ///
    /// - Note: This compares the **magnitude**, or the length, of two vectors.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.magnitudeSquared() < rhs.magnitudeSquared()
    }

    /// Returns a Boolean value indicating whether the magnitude of the first argument
    /// is greater than that of the second argument.
    ///
    /// - Note: This compares the **magnitude**, or the length, of two vectors.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable public static func > (lhs: Self, rhs: Self) -> Bool {
        lhs.magnitudeSquared() > rhs.magnitudeSquared()
    }

    /// Returns a Boolean value indicating whether the magnitude of the first argument
    /// is less than or equal to that of the second argument.
    ///
    /// - Note: This compares the **magnitude**, or the length, of two vectors.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @inlinable public static func <= (lhs: Self, rhs: Self) -> Bool {
        lhs.magnitudeSquared() <= rhs.magnitudeSquared()
    }

    /// Returns a Boolean value indicating whether the magnitude of the first argument
    /// is greater than or equal to that of the second argument.
    ///
    /// - Note: This compares the **magnitude**, or the length, of two vectors.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare..
    @inlinable public static func >= (lhs: Self, rhs: Self) -> Bool {
        lhs.magnitudeSquared() >= rhs.magnitudeSquared()
    }
}
