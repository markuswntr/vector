import Foundation

/// A protocol for highly efficient and parallel processing optimized "raw" vectors (e.g. simd).
/// Types conforming to this protocol are used to load an optimized vector into a `Vector(2|3|4)` instance
/// based on the `Element` type within the collection.
public protocol RawVector: Collection {

    /// Initialize to a vector with all elements equal to `scalar`.
    init(_ scalar: Element)

    /// Initialize to a vector with elements taken from `array`.
    ///
    /// - Precondition: `array` must have the exact same length as the vector.
    init(_ array: [Element])

    /// Access individual elements of the vector via subscript.
    subscript(index: Swift.Int) -> Element { get set }
}

extension RawVector {

    /// Initialize to a vector with all elements equal to `scalar`.
    @_transparent
    public init(scalar: Element) {
        self.init(scalar)
    }

    /// Initialize to a vector with elements taken from `sequence`.
    ///
    /// - Precondition: `sequence` must have the exact same count as the vector.
    @_transparent
    public init<Sequence>(sequence: Sequence) where Sequence: Swift.Sequence, Sequence.Element == Self.Element {
        self.init(Array(sequence))
    }
}

// MARK: - Specifics

public protocol RawVector2: RawVector {

    /// Initialize a vector with the specified elements.
    init(_ x: Element, _ y: Element)
}

public protocol RawVector3: RawVector {

    /// Initialize a vector with the specified elements.
    init(_ x: Element, _ y: Element, _ z: Element)
}

public protocol RawVector4: RawVector {

    /// Initialize a vector with the specified elements.
    init(_ x: Element, _ y: Element, _ z: Element, _ w: Element)
}
