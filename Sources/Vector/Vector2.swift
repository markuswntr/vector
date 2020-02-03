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

/// Defines a 2-dimensional vector, backed by `SIMD2` and described by an `SIMDScalar` element type
public struct Vector2<Scalar>: EuclideanVector where Scalar: SIMDScalar {
    public typealias RawValue = SIMD2<Scalar>

    /// The raw value storage of the vector
    public var rawValue: RawValue

    /// Creates a new vector to given rawValue storage.
    /// - Parameter rawValue: The rawValue storage to back this vector
    @inlinable public init(rawValue: RawValue) {
        self.rawValue = rawValue
    }
}

// MARK: Projection
extension Vector2 {

    /// The components of the vector when orthogonal projected, i.e. (x,y)
    public struct OrthogonalProjection: Projection, Equatable {

        /// The x-compontent of the vector in an orthogonal projection
        @inlinable public var x: Scalar { storage[0] }

        /// The y-compontent of the vector in an orthogonal projection
        @inlinable public var y: Scalar { storage[1] }

        /// The unprojected vector storage
        public let storage: RawValue

        /// Creates a projected view on given vector storage.
        /// - Parameter storage: The storage of the vector to project
        @inlinable public init(on storage: RawValue) {
            self.storage = storage
        }

        /// Returns a Boolean value indicating whether the projected values are equal.
        ///
        /// Equality is the inverse of inequality.
        /// For any values `a` and `b`, `a == b` implies that `a != b` is `false`.
        ///
        /// - Parameters:
        ///   - lhs: A value to compare.
        ///   - rhs: Another value to compare.
        @inlinable public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.storage == rhs.storage
        }
    }

    /// Creates a new vector from given orthogonal projected values.
    /// - Parameter projectedX: The orthogonal projected x-axis value of the resulting vector.
    /// - Parameter projectedY: The orthogonal projected y-axis value of the resulting vector.
    @inlinable public init(x projectedX: Scalar, y projectedY: Scalar) {
        self.init(rawValue: .init(projectedX, projectedY))
    }
}

// MARK: Direction
extension Vector2 where Scalar: FloatingPoint {

//    @inlinable init(magnitude: Scalar, direction radian: Scalar) {
//        self.init(rawValue: .init(x: magnitude * cos(radian), y: magnitude * sin(radian)))
//    }

    //    @inlinable init(magnitude: Scalar, direction degree: Scalar) {}

    /// The direction of the vector.
    ///
    /// Calculated as the inverse tangent of the quotient of dividing the orthogonal projected values Y by X.

    //TODO: choose between rad/deg? choose between axis (y/x direction, z/y direction)?
//    @inlinable func direction() -> Scalar {
//        atan(rawValue[1] / rawValue[0])
//    }
}

//extension Vector where Scalar == Float64 {
//
//    @inlinable func direction() -> Scalar {
//        // tan–1(y/x)
//        atan(rawValue[1]/rawValue[0])
//    }
//}
//
//extension Vector where Scalar: FixedWidthInteger {
//
//    @inlinable func direction() -> Float32 {
//        atan(.init(rawValue[1] / rawValue[0]))
//    }
//
//    @inlinable func direction() -> Float64 {
//        atan(.init(rawValue[1] / rawValue[0]))
//    }
//
//    @inlinable func direction() -> Float80 {
//        atan(.init(rawValue[1] / rawValue[0]))
//         * 180/ Double.pi
//    }
//}

//extension Vector2: Equatable, Comparable where Scalar: Comparable & FixedWidthInteger { }
//
//extension Vector2: Equatable, Comparable where Scalar: Comparable & FloatingPoint { }
