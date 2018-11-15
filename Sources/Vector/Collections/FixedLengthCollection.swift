import Foundation

/// A non-resizable collection type, i.e. that is of known and fixed length at compile time.
public protocol FixedLengthCollection: Collection where Self.Index: FixedLengthIndex {

    /// A type that provides the collection's iteration interface and
    /// encapsulates its iteration state.
    ///
    /// By default, a collection conforms to the `Sequence` protocol by
    /// supplying `IndexingIterator` as its associated `Iterator`
    /// type.
    associatedtype Iterator = IndexingIterator<[Self.Element]>
}

extension FixedLengthCollection {

    /// The position of the first element in a nonempty collection.
    ///
    /// If the collection is empty, `startIndex` is equal to `endIndex`.
    public var startIndex: Self.Index {
        return indices.startIndex
    }

    /// The collection's "past the end" position---that is, the position one
    /// greater than the last valid subscript argument.
    ///
    /// When you need a range that includes the last element of a collection, use
    /// the half-open range operator (`..<`) with `endIndex`. The `..<` operator
    /// creates a range that doesn't include the upper bound, so it's always
    /// safe to use with `endIndex`. For example:
    ///
    ///     let numbers = [10, 20, 30, 40, 50]
    ///     if let index = numbers.firstIndex(of: 30) {
    ///         print(numbers[index ..< numbers.endIndex])
    ///     }
    ///     // Prints "[30, 40, 50]"
    ///
    /// If the collection is empty, `endIndex` is equal to `startIndex`.
    public var endIndex: Self.Index {
        return indices.endIndex
    }

    /// Returns an iterator over the elements of the collection.
    public func makeIterator() -> IndexingIterator<[Self.Element]> {
        return indices.map({ self[$0] }).makeIterator()
    }
}

extension FixedLengthCollection where Self: BidirectionalCollection {

    public func index(after idx: Self.Index) -> Self.Index {
        return indices.index(after: idx)
    }

    public func index(before idx: Self.Index) -> Self.Index {
        return indices.index(before: idx)
    }
}
