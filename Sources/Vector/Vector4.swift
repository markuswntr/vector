import Foundation

/// Indices of a `Vector4` are described by 4 indexed values
///
/// - index0: The index that describes the first position in the collection
/// - index1: The index that describes the second position in the collection
/// - index2: The index that describes the third position in the collection
/// - index3: The index that describes the forth position in the collection
public enum VectorIndex4: Swift.Int, VectorIndex {
    case index0 // Examples: On Point2, this would be `x`, on sizes this would be `width`, on RGBA colors this would be `r`
    case index1 // Examples: On Point2, this would be `y`, on sizes this would be `height`, on RGBA colors this would be `g`
    case index2 // Examples: On Point3, this would be `z`, on rgba colors this would be `b`
    case index3 // Examples: On RGBA colors this would be `a`
}

/// Defines a 4-dimensional vector, backed by a `RawVector4` and described by an element type that is `RawVectorizable4`
public protocol Vector4: VectorProtocol where Element: RawVectorizable4, Element.RawVector4: Equatable {

    /// The vector type of the underlying optimized vector
    associatedtype Vector = Element.RawVector4

    /// Indices of a `Vector4`
    associatedtype Index = VectorIndex4
}

extension Vector4 where Vector == Element.RawVector4 {

    /// Initialize a vector with the specified elements.
    @_transparent public init(index0: Element, index1: Element, index2: Element, index3: Element) {
        self.init(vector: .init(index0, index1, index2, index3))
    }
}
