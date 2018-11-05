import Foundation

/// A type that represents a position in the collection
public protocol FixedLengthIndex: Comparable {}

extension FixedLengthIndex where Self: RawRepresentable, Self.RawValue: Equatable {
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }
}

extension FixedLengthIndex where Self: RawRepresentable, Self.RawValue: Comparable {

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
    public static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

extension FixedLengthIndex where Self: RawRepresentable, Self.RawValue: Hashable {

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    public var hashValue: Int {
        return rawValue.hashValue
    }
}

/// A random access and a compile-time non-resizable collection (a collection of known and fixed length).
public protocol FixedLengthCollection: RandomAccessCollection where Index: FixedLengthIndex {

    /// Access individual elements of the collection via subscript.
    subscript(position: Index) -> Element { get set }

    /// Accesses a contiguous subrange of the collection's elements.
    ///
    /// The accessed slice uses the same indices for the same elements as the
    /// original collection uses. Always use the slice's `startIndex` property
    /// instead of assuming that its indices start at a particular value.
    ///
    /// This example demonstrates getting a slice of an array of strings, finding
    /// the index of one of the strings in the slice, and then using that index
    /// in the original array.
    ///
    ///     let streets = ["Adams", "Bryant", "Channing", "Douglas", "Evarts"]
    ///     let streetsSlice = streets[2 ..< streets.endIndex]
    ///     print(streetsSlice)
    ///     // Prints "["Channing", "Douglas", "Evarts"]"
    ///
    ///     let index = streetsSlice.firstIndex(of: "Evarts")    // 4
    ///     print(streets[index!])
    ///     // Prints "Evarts"
    ///
    /// - Parameter bounds: A range of the collection's indices. The bounds of
    ///   the range must be valid indices of the collection.
    ///
    /// - Complexity: O(1)
    subscript(bounds: [Index]) -> [Element] { get }
}

public extension FixedLengthCollection where Index: CaseIterable {

    public var startIndex: Index {
        return indices.startIndex
    }

    public var endIndex: Index {
        return indices.endIndex
    }

    public func index(after i: Index) -> Index {
        return indices.index(after: i)
    }

    public func index(before i: Index) -> Index {
        return indices.index(before: i)
    }

    public func makeIterator() -> IndexingIterator<[Element]> {
        return indices.map({ self[$0] }).makeIterator()
    }

    public subscript(bounds: [Index]) -> [Element] {
        return bounds.map({ self[$0] })
    }
}
