import Foundation

/// <#Description#>
public struct Vector3<Scalar>: VectorCollection, ExpressibleByArrayLiteral where Scalar: Numeric & SIMDVectorizable3 {

    /// The internal (simd) vector class in use of this vector
    public typealias _Vector = Scalar._Vector3

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
