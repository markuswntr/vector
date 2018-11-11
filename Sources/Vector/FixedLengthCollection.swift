import Foundation

/// A type that represents a position in the collection
public protocol FixedLengthIndex: Comparable {

    /// A type that can represent a collection of all indices of this type.
    associatedtype AllIndices: Collection where Self.AllIndices.Element == Self

    /// A collection of all indices of this type.
    static var allIndices: Self.AllIndices { get }
}

extension FixedLengthIndex where Self: CaseIterable {

    /// A collection of all indices of this type.
    public static var allIndices: Self.AllCases {
        return allCases
    }
}

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

/// A random access and compile-time non-resizable collection (a collection of known and fixed length).
public protocol FixedLengthCollection: RandomAccessCollection where Self.Index: FixedLengthIndex { // TODO: Random Access is to strict

    /// Access individual elements of the collection via subscript.
    subscript(position: Self.Index) -> Self.Element { get set }

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
    subscript(bounds: [Self.Index]) -> [Self.Element] { get }

    /// Access individual elements of the collection via index.
    func element(at index: Self.Index) -> Self.Element
}

public extension FixedLengthCollection {

    public var startIndex: Self.Index {
        return indices.startIndex
    }

    public var endIndex: Self.Index {
        return indices.endIndex
    }

    public func index(after idx: Self.Index) -> Self.Index {
        return indices.index(after: idx)
    }

    public func index(before idx: Self.Index) -> Self.Index {
        return indices.index(before: idx)
    }

    public func makeIterator() -> IndexingIterator<[Self.Element]> {
        return indices.map(element(at:)).makeIterator()
    }

    public subscript(bounds: [Self.Index]) -> [Self.Element] {
        return bounds.map(element(at:))
    }

    func element(at index: Self.Index) -> Self.Element {
        return self[index]
    }
}

public extension FixedLengthCollection where Self.Index: RawRepresentable, Self.Index.RawValue == Int {

    public subscript(bounds: [Self.Index]) -> [Self.Element] {
        get { return bounds.map(element(at:)) }
        set {
            for index in bounds {
                self[index] = newValue[index.rawValue]
            }
        }
    }
}
