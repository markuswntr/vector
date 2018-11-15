import Foundation

/// A non-resizable random access collection, that defines vector spaces (cardinality) by the length of it.
public protocol VectorCollection: RandomAccessCollection, FixedLengthCollection {

    /// The scalar values of the vector
    associatedtype Scalar: Numeric

    /// The collection elements are the `Scalar` values of the vector
    associatedtype Element = Scalar

    /// The index, and therefore the indices, are defined by a `VectorIndex`
    associatedtype Index = VectorCollectionIndex

    /// Access individual elements of the collection via subscript.
    subscript(position: Self.Index) -> Self.Element { get set }

    /// Initialize to a vector with all elements at `scalar` value.
    init(scalar: Scalar)

    /// Initialize to a vector with elements taken from `sequence`.
    ///
    /// - Precondition: `sequence` must have the exact same count as the vector.
    init<Sequence>(sequence: Sequence) where Sequence: Swift.Sequence, Sequence.Element == Self.Element

    /// The zero vector, i.e. the origin of the vector space.
    static var zero: Self { get }
}

// MARK: - Explicit Extensions
extension VectorCollection {

    /// Cardinality of the vector space
    public var cardinality: Int {
        return count
    }
}

// MARK: - Implicit Extensions
// MARK: RandomAccessCollection
extension VectorCollection {

    public subscript(bounds: [Self.Index]) -> [Self.Element] {
        return bounds.map({ self[$0] })
    }
}

// MARK: ExpressibleByArrayLiteral
extension VectorCollection where Self: ExpressibleByArrayLiteral {

    public typealias ArrayLiteralElement = Element

    public init(arrayLiteral elements: Element...) {
        self.init(sequence: elements)
    }
}

// MARK: - Scalar is ExpressibleByIntegerLiteral {
extension VectorCollection where Scalar: ExpressibleByIntegerLiteral {

    /// The zero vector, i.e. the origin of the vector space.
    public static var zero: Self {
        return .init(scalar: 0)
    }
}

// MARK: - Scalar is FixedWidthInteger
extension VectorCollection where Scalar: FixedWidthInteger {

    /// The maximum representable vector in this type.
    ///
    /// For unsigned integer scalars, all values of this vector are `(2 ** bitWidth) - 1`, where `**` is exponentiation.
    /// For signed integer scalars, all values of this vector are `(2 ** (bitWidth - 1)) - 1`.
    public static var max: Self {
        return .init(scalar: .max)
    }

    /// The minimum representable vector in this type.
    ///
    /// For unsigned integer types, all values are always `0` and therefore equal to the `zero` vector.
    /// For signed integer scalars, all values of this vector are `-(2 ** (bitWidth - 1))`, where `**` is exponentiation.
    public static var min: Self {
        return .init(scalar: .min)
    }
}

// MARK: - Scalar is FloatingPoint
extension VectorCollection where Scalar: FloatingPoint {

    /// Positive infinity.
    ///
    /// Infinity compares greater than all finite vector and equal to other infinite vectors.
    ///
    ///     let x = Vector2<Double>.greatestFinite
    ///     let y = x * 2
    ///     // y == Vector2<Double>.infinity
    ///     // y > x
    public static var infinity: Self {
        return .init(scalar: .infinity)
    }

    /// The greatest finite vector representable by this type.
    ///
    /// This vector compares greater than or equal to all finite numbers, but less than `infinity`.
    ///
    /// This vectors values corresponds to type-specific C macros such as `FLT_MAX` and `DBL_MAX`.
    /// The naming of those macros is slightly misleading, because `infinity` is greater than this value.
    public static var greatestFinite: Self {
        return .init(scalar: .greatestFiniteMagnitude)
    }

    /// The least positive normal vector.
    ///
    /// This value compares less than or equal to all positive normal vectors.
    /// There may be smaller positive vectors, but they are *subnormal*,
    /// meaning that they are represented with less precision than normal vectors.
    ///
    /// This vectors values corresponds to type-specific C macros such as `FLT_MIN` and `DBL_MIN`.
    /// The naming of those macros is slightly misleading, because subnormals, zeros, and negative numbers are smaller than this value.
    public static var leastNormal: Self {
        return .init(scalar: .leastNormalMagnitude)
    }

    /// The least positive number.
    ///
    /// This value compares less than or equal to all positive numbers, but
    /// greater than zero. If the type supports subnormal values,
    /// `leastNonzeroMagnitude` is smaller than `leastNormalMagnitude`;
    /// otherwise they are equal.
    public static var leastNonzero: Self {
        return .init(scalar: .leastNonzeroMagnitude)
    }
}
