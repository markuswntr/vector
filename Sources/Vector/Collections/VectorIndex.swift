import Foundation

/// Defines the common set of protocols to be implemented by any concrete `VectorIndex`.
public typealias VectorCollectionIndex = FixedLengthIndex & CaseIterable

/// Indices of a `Vector2` are described by 2 indexed values
///
/// - index0: The index of the value within the collection that describes the first position
/// - index1: The index of the value within the collection that describes the second position
public enum VectorIndex2: Int, VectorCollectionIndex {
    case index0 // Examples: On Point2, this would be `x`, on sizes this would be `width`, on RGBA colors this would be `r`
    case index1 // Examples: On Point2, this would be `y`, on sizes this would be `height`, on RGBA colors this would be `g`
}

/// Indices of a `Vector3` are described by 3 indexed values
///
/// - index0: The index of the value within the collection that describes the first position
/// - index1: The index of the value within the collection that describes the second position
/// - index2: The index of the value within the collection that describes the third position
public enum VectorIndex3: Int, VectorCollectionIndex {
    case index0 // Examples: On Point2, this would be `x`, on sizes this would be `width`, on RGBA colors this would be `r`
    case index1 // Examples: On Point2, this would be `y`, on sizes this would be `height`, on RGBA colors this would be `g`
    case index2 // Examples: On Point3, this would be `z`, on RGBA colors this would be `b`
}

/// Indices of a `Vector4` are described by 4 indexed values
///
/// - index0: The index of the value within the collection that describes the first position
/// - index1: The index of the value within the collection that describes the second position
/// - index2: The index of the value within the collection that describes the third position
/// - index3: The index of the value within the collection that describes the forth position
public enum VectorIndex4: Int, VectorCollectionIndex {
    case index0 // Examples: On Point2, this would be `x`, on sizes this would be `width`, on RGBA colors this would be `r`
    case index1 // Examples: On Point2, this would be `y`, on sizes this would be `height`, on RGBA colors this would be `g`
    case index2 // Examples: On Point3, this would be `z`, on rgba colors this would be `b`
    case index3 // Examples: On RGBA colors this would be `a`
}
