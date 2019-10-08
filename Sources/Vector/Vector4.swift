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

/// Defines a 4-dimensional vector, backed by a `SIMDX4` and described by an element type that is `RawStorable4`
public struct Vector4<Scalar>: Vector where Scalar: RawStorable4 {
    public typealias RawValue = SIMDX4<Scalar>
    public typealias Index = RawValue.Index

    /// The raw value storage of the vector
    public var rawValue: RawValue

    /// Inititializes a new vector to given rawValue storage.
    /// - Parameter rawValue: The rawValue storage to back this vector
    @inlinable public init(rawValue: RawValue) {
        self.rawValue = rawValue
    }

    @inlinable public init(projectedX x: Scalar, y: Scalar, z: Scalar, w: Scalar) {
        self.init(rawValue: .init(index0: x, index1: y, index2: z, index3: w))
    }
}

// MARK: Magnitude & Direction
extension Vector4 {

    /// The cardinality of the vector spaces, i.e. the count of components
    @inlinable public var count: Int { 4 }
}

// MARK: Projection
extension Vector4 {

    /// The components of the vector when orthogonal projected, i.e. (x,y,z,w)
    public struct OrthogonalProjection: Projection {

        /// The unprojected vector storage
        public let storage: RawValue

        /// Initializes a projected view on given vector storage.
        @inlinable public init(on storage: RawValue) {
            self.storage = storage
        }

        /// The x-compontent of the vector in an orthogonal projection
        @inlinable public var x: Scalar { storage[.index0] }

        /// The y-compontent of the vector in an orthogonal projection
        @inlinable public var y: Scalar { storage[.index1] }

        /// The z-compontent of the vector in an orthogonal projection
        @inlinable public var z: Scalar { storage[.index2] }

        /// The z-compontent of the vector in an orthogonal projection
        @inlinable public var w: Scalar { storage[.index3] }
    }
}
