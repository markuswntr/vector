import Foundation

public protocol MultiplicativeArithmetic: Arithmetic {

    /// Elementwise product of `lhs` and `rhs` (A.k.a. the Hadamard or Schur vector product).
    static func * (lhs: Self, rhs: Self) -> Self

    /// Scalar-Vector product.
    static func * (lhs: Scalar, rhs: Self) -> Self

    /// Scalar-Vector product.
    static func * (lhs: Self, rhs: Scalar) -> Self

    /// Elementwise quotient of `lhs` and `rhs`.
    static func / (lhs: Self, rhs: Self) -> Self

    /// Divide vector by scalar.
    static func / (lhs: Self, rhs: Scalar) -> Self

    /// Multiply `lhs` by `rhs` (elementwise).
    static func *= (lhs: inout Self, rhs: Self)

    /// Divide `lhs` by `rhs` (elementwise).
    static func /= (lhs: inout Self, rhs: Self)

    /// Scales `lhs` by `rhs`.
    static func *= (lhs: inout Self, rhs: Scalar)

    /// Scales `lhs` by `1/rhs`.
    static func /= (lhs: inout Self, rhs: Scalar)
}

// MultiplicativeArithmetic for FixedWidthInteger types that might overflow on the folllowing operations
public protocol MultiplicativeOverflowArithmetic: Arithmetic {

    /// Elementwise product of `lhs` and `rhs` (A.k.a. the Hadamard or Schur vector product).
    static func &* (lhs: Self, rhs: Self) -> Self

    /// Scalar-Vector product.
    static func &* (lhs: Scalar, rhs: Self) -> Self

    /// Scalar-Vector product.
    static func &* (lhs: Self, rhs: Scalar) -> Self

    /// Elementwise quotient of `lhs` and `rhs`.
    static func / (lhs: Self, rhs: Self) -> Self

    /// Divide vector by scalar.
    static func / (lhs: Self, rhs: Scalar) -> Self

    /// Divide `lhs` by `rhs` (elementwise).
    static func /= (lhs: inout Self, rhs: Self)
}
