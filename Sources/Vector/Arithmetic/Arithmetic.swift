import Foundation

/// A vector type capable of arithmetic operations
public protocol Arithmetic {

    /// The scalar of the conforming vector type
    associatedtype Scalar: Numeric
}
