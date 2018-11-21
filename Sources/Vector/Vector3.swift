import Foundation

/// Indices of a `Vector3` are described by 3 indexed values
///
/// - index0: The index that describes the first position in the collection
/// - index1: The index that describes the second position in the collection
/// - index2: The index thate describes the third position in the collection
public enum VectorIndex3: Swift.Int, VectorIndex {
    case index0 // Examples: On Point2, this would be `x`, on sizes this would be `width`, on RGBA colors this would be `r`
    case index1 // Examples: On Point2, this would be `y`, on sizes this would be `height`, on RGBA colors this would be `g`
    case index2 // Examples: On Point3, this would be `z`, on RGBA colors this would be `b`
}

/// Defines a 3-dimensional vector, backed by a `RawVector3` and described by a `Scalar` type that is `RawVectorizable3`
public struct Vector3<Scalar>: VectorProtocol, Equatable where Scalar: Numeric & RawVectorizable3, Scalar.RawVector3: Equatable {

    /// Vector is defined by `Scalar` values, that are `Element`s of this collection
    public typealias Element = Scalar

    /// The vector type of the underlying optimized vector
    public typealias Vector = Scalar.RawVector3

    /// Indices of a `Vector3` are described by `VectorIndex3`
    public typealias Index = VectorIndex3

    /// The underlying optimized vector
    public var _vector: Vector

    /// Initializes `self` with given vector as underlying optimized vector
    ///
    /// - Parameter vector: The vector to mask behind `self`.
    @_transparent public init(vector: Vector) {
        _vector = vector
    }
}
