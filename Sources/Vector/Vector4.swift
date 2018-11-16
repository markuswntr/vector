import Foundation

/// Indices of a `Vector4` are described by 4 indexed values
///
/// - index0: The index that describes the first position in the collection
/// - index1: The index that describes the second position in the collection
/// - index2: The index that describes the third position in the collection
/// - index3: The index that describes the forth position in the collection
public enum VectorIndex4: Int, VectorIndex {
    case index0 // Examples: On Point2, this would be `x`, on sizes this would be `width`, on RGBA colors this would be `r`
    case index1 // Examples: On Point2, this would be `y`, on sizes this would be `height`, on RGBA colors this would be `g`
    case index2 // Examples: On Point3, this would be `z`, on rgba colors this would be `b`
    case index3 // Examples: On RGBA colors this would be `a`
}

/// Defines a 4-dimensional vector, backed by a `RawVector4` and described by a `Scalar` type that is `RawVectorizable4`
public protocol Vector4: VectorProtocol where Scalar: RawVectorizable4 {

    /// The vector type of the underlying optimized vector
    associatedtype Vector = Scalar.RawVector4

    /// Indices of a `Vector4` are described by `VectorIndex4`
    associatedtype Index = VectorIndex4
}
