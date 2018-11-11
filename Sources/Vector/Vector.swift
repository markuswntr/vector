import Foundation

/// A protocol for any vector
public protocol Vector: FixedLengthCollection {

    /// The scalar values of the vector
    associatedtype Scalar: Numeric

    associatedtype Element = Scalar

    /// Initialize to the zero vector.
    init()

    /// Initialize to a vector with all elements equal to `scalar`.
    init(scalar: Scalar)

    /// Initialize to a vector with elements taken from `sequence`.
    ///
    /// - Precondition: `sequence` must be smaller or equal the length of vector. Missing values will be initialized to `0`.
    init<S>(_ sequence: S) where S: Sequence, S.Element == Element
}

extension Vector {

    /// Initialize to the zero vector.
    public init() {
        self.init(scalar: 0)
    }
}

extension Vector where Self: ExpressibleByArrayLiteral {

    public typealias ArrayLiteralElement = Element

    /// Creates an instance initialized with the given elements.
    ///
    /// - Precondition: `elements` must be smaller or equal the length of vector. Missing values will be initialized to `0`.
    public init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
}

extension Vector where Self.Index: RawRepresentable, Self.Index.RawValue == Int {

    public init<S>(_ sequence: S) where S: Sequence, S.Element == Element {
        self.init(scalar: 0) // Pre-populate
        for (offset, element) in sequence.enumerated() {
            guard let index = Index(rawValue: offset) else {
                fatalError("\(offset) cannot not be represented by \(Index.self)")
            }
            self[index] = element
        }
    }
}
