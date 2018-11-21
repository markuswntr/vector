import Foundation

/// A type that represents a position in the collection
public protocol StaticCollectionIndex: Comparable {

    /// A type that can represent a collection of all indices of this type.
    associatedtype AllIndices: Collection where Self.AllIndices.Element == Self

    /// A collection of all indices of this type.
    static var allIndices: Self.AllIndices { get }
}

extension StaticCollectionIndex where Self: CaseIterable {

    /// A collection of all indices of this type.
    public static var allIndices: Self.AllCases {
        return allCases
    }
}

extension StaticCollectionIndex where Self: RawRepresentable, Self.RawValue: Equatable {

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

extension StaticCollectionIndex where Self: RawRepresentable, Self.RawValue: Comparable {

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

extension StaticCollectionIndex where Self: RawRepresentable, Self.RawValue: Hashable {

    /// The hash value.
    ///
    /// Hash values are not guaranteed to be equal across different executions of
    /// your program. Do not save hash values to use during a future execution.
    public var hashValue: Swift.Int {
        return rawValue.hashValue
    }
}
