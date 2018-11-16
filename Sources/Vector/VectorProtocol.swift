import Foundation

// Defines a n-dimensional vector, backed by a `RawVector` and described by `Scalar` values
public protocol VectorProtocol: VectorCollection where Vector.Element == Self.Element {

    /// The scalar type of the vector
    associatedtype Scalar: Numeric

    /// Vector is defined by `Scalar` values, that are `Element`s of this collection
    associatedtype Element = Scalar

    /// The vector type of the underlying optimized vector
    associatedtype Vector: RawVector

    /// The underlying parallel computing optimized vector
    var _vector: Vector { get set }

    /// Initializes `self` with given vector as underlying optimized vector
    ///
    /// This is the designed initializer for `VectorProtocol` conforming types.
    /// All default initializers in protocol extensions route the resulting vector through this initializer.
    /// Given value `vector` may be used to resolve property `_vector` on assignment.
    ///
    /// - Parameter vector: The vector masked by `self`
    init(vector: Vector)
}

extension VectorProtocol {

    /// Initialize to a vector with all elements at `scalar` value.
    public init(scalar: Self.Element) {
        self.init(vector: Self.Vector(scalar: scalar))
    }

    /// Initialize to a vector with elements taken from `sequence`.
    ///
    /// - Precondition: `sequence` must have the exact same count as the vector.
    public init<S>(sequence: S) where S: Sequence, Self.Element == S.Element {
        self.init(vector: Self.Vector(sequence: sequence))
    }
}

extension VectorProtocol where Vector.RawVectorIndex == Self.Index {

    /// Access individual elements of the vector via subscript.
    public subscript(position: Self.Index) -> Self.Element {
        set { _vector[position] = newValue }
        get { return _vector[position] }
    }
}

extension VectorProtocol where Vector.Iterator == Self.Iterator {

    /// Returns an iterator over the elements of the collection.
    public func makeIterator() -> Self.Iterator {
        return _vector.makeIterator()
    }
}

extension VectorProtocol where Vector: Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`, `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs._vector == rhs._vector
    }
}
