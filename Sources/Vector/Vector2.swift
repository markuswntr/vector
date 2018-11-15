import Foundation

/// <#Description#>
public struct Vector2<Scalar>: VectorCollection, ExpressibleByArrayLiteral where Scalar: Numeric & SIMDVectorizable2 {

    /// The internal (simd) vector class in use of this vector
    public typealias _Vector = Scalar._Vector2

    /// The collection index describing this vector
    public typealias Index = _Vector.VectorIndex

    /// The underlying/wrapped simd vector
    private var vector: _Vector

    /// Access individual elements of the collection via subscript.
    public subscript(position: Index) -> Scalar {
        set { vector[position] = newValue }
        get { return vector[position] }
    }

    /// Initialize to a vector with all elements equal to `scalar`.
    public init(scalar: Scalar) {
        vector = _Vector(scalar: scalar)
    }

    /// Initialize to a vector with elements taken from `sequence`.
    ///
    /// - Precondition: `sequence` must have the exact same count as the vector.
    public init<Sequence>(sequence: Sequence) where Sequence: Swift.Sequence, Sequence.Element == Element {
        vector = _Vector(sequence: sequence)
    }
}

extension Vector2: Equatable where Scalar: Equatable, Scalar._Vector2: Equatable {

    public static func == (lhs: Vector2<Scalar>, rhs: Vector2<Scalar>) -> Bool {
        return lhs.vector == rhs.vector
    }
}
