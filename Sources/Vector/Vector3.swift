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

/// Defines a 3-dimensional vector, backed by a `RawVector3` and described by an element type that is `RawVectorizable3`
public protocol Vector3: VectorProtocol where Element: RawVectorizable3, Element.RawVector3: Equatable {

    /// The vector type of the underlying optimized vector
    associatedtype Vector = Element.RawVector3

    /// Indices of a `Vector3`
    associatedtype Index = VectorIndex3
}

extension Vector3 where Vector == Element.RawVector3 {

    /// Initialize a vector with the specified elements.
    @_transparent public init(index0: Element, index1: Element, index2: Element) {
        self.init(vector: .init(index0, index1, index2))
    }
}
