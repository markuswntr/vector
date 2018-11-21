import Foundation

/// Indices of a `Vector2` are described by 2 indexed values
///
/// - index0: The index that describes the first position in the collection
/// - index1: The index that describes the second position in the collection
public enum VectorIndex2: Swift.Int, VectorIndex {
    case index0 // Examples: On Point2, this would be `x`, on sizes this would be `width`, on RGBA colors this would be `r`
    case index1 // Examples: On Point2, this would be `y`, on sizes this would be `height`, on RGBA colors this would be `g`
}

/// Defines a 2-dimensional vector, backed by a `RawVector2` and described by a `Scalar` type that is `RawVectorizable2`
public struct Vector2<Scalar>: VectorProtocol where Scalar: Numeric & RawVectorizable2 {

    /// Vector is defined by `Scalar` values, that are `Element`s of this collection
    public typealias Element = Scalar

    /// The vector type of the underlying optimized vector
    public typealias Vector = Scalar.RawVector2

    /// Indices of a `Vector2` are described by `VectorIndex2`
    public typealias Index = VectorIndex2

    /// The underlying optimized vector
    public var _vector: Vector

    /// Initializes `self` with given vector as underlying optimized vector
    ///
    /// - Parameter vector: The vector to mask behind `self`.
    public init(vector: Vector) {
        _vector = vector
    }
}
