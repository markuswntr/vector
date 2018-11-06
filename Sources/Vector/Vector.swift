import Foundation

/// A protocol for any vector
public protocol Vector: FixedLengthCollection, ExpressibleByArrayLiteral {

    /// The scalar values of the vector
    associatedtype Scalar: Numeric

    associatedtype Element = Scalar

    associatedtype ArrayLiteralElement = Element

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

    public init() {
        self.init(scalar: 0)
    }

    // MARK: ExpressibleByArrayLiteral

    /// Creates an instance initialized with the given elements.
    ///
    /// - Precondition: `elements` must be smaller or equal the length of vector. Missing values will be initialized to `0`.
    public init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
}

extension Vector where Index: RawRepresentable, Index.RawValue == Int {

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
