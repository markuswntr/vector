import Foundation

/// Defines a 2-dimensional vector, backed by a `RawVector2` and described by a `Scalar` type that is `RawVectorizable2`
public struct Vector2<Scalar>: VectorProtocol, Equatable where Scalar: Numeric & RawVectorizable2, Scalar.RawVector2: Equatable {

    /// Indices of a `Vector2` are described by 2 indexed values
    ///
    /// - index0: The index that describes the first position in the collection
    /// - index1: The index that describes the second position in the collection
    public enum Index: Swift.Int, VectorIndex {
        case index0 // Examples: On Point2, this would be `x`, on sizes this would be `width`, on RGBA colors this would be `r`
        case index1 // Examples: On Point2, this would be `y`, on sizes this would be `height`, on RGBA colors this would be `g`
    }

    /// Vector is defined by `Scalar` values, that are `Element`s of this collection
    public typealias Element = Scalar

    /// The vector type of the underlying optimized vector
    public typealias Vector = Scalar.RawVector2

    /// The underlying optimized vector
    public var _vector: Vector

    /// Initializes `self` with given vector as underlying optimized vector
    ///
    /// - Parameter vector: The vector to mask behind `self`.
    @_transparent public init(vector: Vector) {
        _vector = vector
    }
}

extension Vector2 {

    /// Initialize a vector with the specified elements.
    @_transparent public init(index0: Scalar, index1: Scalar) {
        self.init(vector: .init(index0, index1))
    }
}
