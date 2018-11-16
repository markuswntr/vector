import Foundation

/// Indices of a `Vector2` are described by 2 indexed values
///
/// - index0: The index that describes the first position in the collection
/// - index1: The index that describes the second position in the collection
public enum VectorIndex2: Int, VectorIndex {
    case index0 // Examples: On Point2, this would be `x`, on sizes this would be `width`, on RGBA colors this would be `r`
    case index1 // Examples: On Point2, this would be `y`, on sizes this would be `height`, on RGBA colors this would be `g`
}

/// Defines a 2-dimensional vector, backed by a `RawVector2` and described by a `Scalar` type that is `RawVectorizable2`
public protocol Vector2: VectorProtocol where Scalar: RawVectorizable2 {

    /// The vector type of the underlying optimized vector
    associatedtype Vector = Scalar.RawVector2

    /// Indices of a `Vector2` are described by `VectorIndex2`
    associatedtype Index = VectorIndex2
}
