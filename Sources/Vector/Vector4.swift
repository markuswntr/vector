import Foundation

/// Defines a 4-dimensional vector, backed by a `RawVector4` and described by a `Scalar` type that is `RawVectorizable4`
public struct Vector4<Scalar>: VectorProtocol, Equatable where Scalar: Numeric & RawVectorizable4, Scalar.RawVector4: Equatable {

    /// Indices of a `Vector4` are described by 4 indexed values
    ///
    /// - index0: The index that describes the first position in the collection
    /// - index1: The index that describes the second position in the collection
    /// - index2: The index that describes the third position in the collection
    /// - index3: The index that describes the forth position in the collection
    public enum Index: Swift.Int, VectorIndex {
        case index0 // Examples: On Point2, this would be `x`, on sizes this would be `width`, on RGBA colors this would be `r`
        case index1 // Examples: On Point2, this would be `y`, on sizes this would be `height`, on RGBA colors this would be `g`
        case index2 // Examples: On Point3, this would be `z`, on rgba colors this would be `b`
        case index3 // Examples: On RGBA colors this would be `a`
    }

    /// Vector is defined by `Scalar` values, that are `Element`s of this collection
    public typealias Element = Scalar

        /// Indices of a `Vector4` are described by `VectorIndex4`
    public typealias Vector = Scalar.RawVector4

    /// The underlying optimized vector
    public var _vector: Vector

    /// Initializes `self` with given vector as underlying optimized vector
    ///
    /// - Parameter vector: The vector to mask behind `self`.
    @_transparent public init(vector: Vector) {
        _vector = vector
    }
}

extension Vector4 {

    /// Initialize a vector with the specified elements.
    @_transparent init(index0: Scalar, index1: Scalar, index2: Scalar, index3: Scalar) {
        self.init(vector: .init(index0, index1, index2, index3))
    }
}
