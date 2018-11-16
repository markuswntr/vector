import Foundation

/// Indices of a `Vector3` are described by 3 indexed values
///
/// - index0: The index that describes the first position in the collection
/// - index1: The index that describes the second position in the collection
/// - index2: The index thate describes the third position in the collection
public enum VectorIndex3: Int, VectorIndex {
    case index0 // Examples: On Point2, this would be `x`, on sizes this would be `width`, on RGBA colors this would be `r`
    case index1 // Examples: On Point2, this would be `y`, on sizes this would be `height`, on RGBA colors this would be `g`
    case index2 // Examples: On Point3, this would be `z`, on RGBA colors this would be `b`
}

/// Defines a 3-dimensional vector, backed by a `RawVector3` and described by a `Scalar` type that is `RawVectorizable3`
public protocol Vector3: VectorProtocol where Scalar: RawVectorizable3 {

    /// The vector type of the underlying optimized vector
    associatedtype Vector = Scalar.RawVector3

    /// Indices of a `Vector3` are described by `VectorIndex3`
    associatedtype Index = VectorIndex3
}
