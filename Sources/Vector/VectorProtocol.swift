import Foundation

// Defines a n-dimensional vector, backed by a `RawVector` and described by `Scalar` values
public protocol VectorProtocol: VectorCollection, ExpressibleByArrayLiteral where Self.Element == Vector.Element {

    /// The vector type of the underlying optimized vector
    associatedtype Vector: RawVector

    /// A type that provides the collection's iteration interface and
    /// encapsulates its iteration state.
    ///
    /// By default, a collection conforms to the `Sequence` protocol by
    /// supplying `IndexingIterator` as its associated `Iterator`
    /// type.
    associatedtype Iterator = Vector.Iterator

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
    @_transparent public init(repeating scalar: Self.Element) {
        self.init(vector: Self.Vector(scalar: scalar))
    }

    /// Initialize to a vector with elements taken from `sequence`.
    ///
    /// - Precondition: `sequence` must have the exact same count as the vector.
    @_transparent  public init<S>(sequence: S) where S: Sequence, Self.Element == S.Element {
        self.init(vector: Self.Vector(sequence: sequence))
    }
}

extension VectorProtocol where Index: RawRepresentable, Index.RawValue == Swift.Int {

    /// Access individual elements of the vector via subscript.
    public subscript(position: Self.Index) -> Self.Element {
        @_transparent set { _vector[position.rawValue] = newValue }
        @_transparent get { return _vector[position.rawValue] }
    }
}

extension VectorProtocol where Self.Iterator == Vector.Iterator {

    /// Returns an iterator over the elements of the collection.
    @_transparent public func makeIterator() -> Self.Iterator {
        return _vector.makeIterator()
    }
}

extension VectorProtocol where Self.Vector: Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`, `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @_transparent public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs._vector == rhs._vector
    }
}

extension VectorProtocol where Self.Vector: Comparable {

    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than that of the second argument.
    ///
    /// This function is the only requirement of the `Comparable` protocol. The
    /// remainder of the relational operator functions are implemented by the
    /// standard library for any type that conforms to `Comparable`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    @_transparent public static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs._vector < rhs._vector
    }
}

// MARK: - Arithmetic

extension VectorProtocol where Self.Vector: AdditiveArithmetic {

    /// Negation of `rhs`.
    @_transparent public prefix static func - (rhs: Self) -> Self {
        return .init(vector: -rhs._vector)
    }

    /// Vector (elementwise) sum of `lhs` and `rhs`.
    @_transparent public static func + (lhs: Self, rhs: Self) -> Self {
        return .init(vector: lhs._vector + rhs._vector)
    }

    /// Vector (elementwise) difference of `lhs` and `rhs`.
    @_transparent public static func - (lhs: Self, rhs: Self) -> Self {
        return .init(vector: lhs._vector - rhs._vector)
    }

    /// Add `rhs` to `lhs`.
    @_transparent public static func += (lhs: inout Self, rhs: Self) {
        lhs._vector += rhs._vector
    }

    /// Subtract `rhs` from `lhs`.
    @_transparent public static func -= (lhs: inout Self, rhs: Self) {
        lhs._vector -= rhs._vector
    }
}

extension VectorProtocol where Self.Vector: AdditiveOverflowArithmetic {

    /// Negation of `rhs`.
    @_transparent public prefix static func - (rhs: Self) -> Self {
        return .init(vector: -rhs._vector)
    }

    /// Vector (elementwise) sum of `lhs` and `rhs`.
    @_transparent public static func &+ (lhs: Self, rhs: Self) -> Self {
        return .init(vector: lhs._vector &+ rhs._vector)
    }

    /// Vector (elementwise) difference of `lhs` and `rhs`.
    @_transparent public static func &- (lhs: Self, rhs: Self) -> Self {
        return .init(vector: lhs._vector &- rhs._vector)
    }
}

extension VectorProtocol where Vector: MultiplicativeArithmetic {

    /// Elementwise product of `lhs` and `rhs` (A.k.a. the Hadamard or Schur vector product).
    @_transparent public static func * (lhs: Self, rhs: Self) -> Self {
        return .init(vector: lhs._vector * rhs._vector)
    }

    /// Scalar-Vector product.
    @_transparent public static func * (lhs: Vector.Scalar, rhs: Self) -> Self {
        return .init(vector: lhs * rhs._vector)
    }

    /// Scalar-Vector product.
    @_transparent public static func * (lhs: Self, rhs: Vector.Scalar) -> Self {
        return .init(vector: lhs._vector * rhs)
    }

    /// Elementwise quotient of `lhs` and `rhs`.
    @_transparent public static func / (lhs: Self, rhs: Self) -> Self {
        return .init(vector: lhs._vector / rhs._vector)
    }

    /// Divide vector by scalar.
    @_transparent public static func / (lhs: Self, rhs: Vector.Scalar) -> Self {
        return .init(vector: lhs._vector / rhs)
    }

    /// Multiply `lhs` by `rhs` (elementwise).
    @_transparent public static func *= (lhs: inout Self, rhs: Self) {
        lhs._vector *= rhs._vector
    }

    /// Divide `lhs` by `rhs` (elementwise).
    @_transparent public static func /= (lhs: inout Self, rhs: Self) {
        lhs._vector /= rhs._vector
    }

    /// Scales `lhs` by `rhs`.
    @_transparent public static func *= (lhs: inout Self, rhs: Vector.Scalar) {
        lhs._vector *= rhs
    }

    /// Scales `lhs` by `1/rhs`.
    @_transparent public static func /= (lhs: inout Self, rhs: Vector.Scalar) {
        lhs._vector /= rhs
    }
}

extension VectorProtocol where Vector: MultiplicativeOverflowArithmetic {

    /// Elementwise product of `lhs` and `rhs` (A.k.a. the Hadamard or Schur vector product).
    @_transparent public static func &* (lhs: Self, rhs: Self) -> Self {
        return .init(vector: lhs._vector &* rhs._vector)
    }

    /// Scalar-Vector product.
    @_transparent public static func &* (lhs: Vector.Scalar, rhs: Self) -> Self {
        return .init(vector: lhs &* rhs._vector)
    }

    /// Scalar-Vector product.
    @_transparent public static func &* (lhs: Self, rhs: Vector.Scalar) -> Self {
        return .init(vector: lhs._vector &* rhs)
    }

    /// Elementwise quotient of `lhs` and `rhs`.
    @_transparent public static func / (lhs: Self, rhs: Self) -> Self {
        return .init(vector: lhs._vector / rhs._vector)
    }

    /// Divide vector by scalar.
    @_transparent public static func / (lhs: Self, rhs: Vector.Scalar) -> Self {
        return .init(vector: lhs._vector / rhs)
    }

    /// Divide `lhs` by `rhs` (elementwise).
    @_transparent public static func /= (lhs: inout Self, rhs: Self) {
        lhs._vector /= rhs._vector
    }
}
