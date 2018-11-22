import Foundation

/// Defines a 3-dimensional vector, backed by a `RawVector3` and described by a `Scalar` type that is `RawVectorizable3`
public struct Vector3<Scalar>: VectorProtocol, Equatable where Scalar: Numeric & RawVectorizable3, Scalar.RawVector3: Equatable {

    /// Indices of a `Vector3` are described by 3 indexed values
    ///
    /// - index0: The index that describes the first position in the collection
    /// - index1: The index that describes the second position in the collection
    /// - index2: The index thate describes the third position in the collection
    public enum Index: Swift.Int, VectorIndex {
        case index0 // Examples: On Point2, this would be `x`, on sizes this would be `width`, on RGBA colors this would be `r`
        case index1 // Examples: On Point2, this would be `y`, on sizes this would be `height`, on RGBA colors this would be `g`
        case index2 // Examples: On Point3, this would be `z`, on RGBA colors this would be `b`
    }

    /// Vector is defined by `Scalar` values, that are `Element`s of this collection
    public typealias Element = Scalar

    /// The vector type of the underlying optimized vector
    public typealias Vector = Scalar.RawVector3

    /// The underlying optimized vector
    public var _vector: Vector

    /// Initializes `self` with given vector as underlying optimized vector
    ///
    /// - Parameter vector: The vector to mask behind `self`.
    @_transparent public init(vector: Vector) {
        _vector = vector
    }
}

extension Vector3 {

    /// Initialize a vector with the specified elements.
    @_transparent init(index0: Scalar, index1: Scalar, index2: Scalar) {
        self.init(vector: .init(index0, index1, index2))
    }
}
