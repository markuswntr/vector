import Foundation

public protocol AdditiveArithmetic: Arithmetic {

    /// Negation of `rhs`.
    prefix static func - (rhs: Self) -> Self

    /// Vector (elementwise) sum of `lhs` and `rhs`.
    static func + (lhs: Self, rhs: Self) -> Self

    /// Vector (elementwise) difference of `lhs` and `rhs`.
    static func - (lhs: Self, rhs: Self) -> Self

    /// Add `rhs` to `lhs`.
    static func += (lhs: inout Self, rhs: Self)

    /// Subtract `rhs` from `lhs`.
    static func -= (lhs: inout Self, rhs: Self)
}

// AdditiveArithmetic for FixedWidthInteger types that might overflow on those operations
public protocol AdditiveOverflowArithmetic: Arithmetic {

    /// Negation of `rhs`.
    prefix static func - (rhs: Self) -> Self

    /// Vector (elementwise) sum of `lhs` and `rhs`.
    static func &+ (lhs: Self, rhs: Self) -> Self

    /// Vector (elementwise) difference of `lhs` and `rhs`.
    static func &- (lhs: Self, rhs: Self) -> Self
}
