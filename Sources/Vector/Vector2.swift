import Foundation

/// <#Description#>
public struct Vector2<Scalar>: Vector where Scalar: Numeric {

    /// Indices of a `Vector2` are described by `x` and `y`, which point to the `x` and `y` value of the `Vector2`
    ///
    /// - x: The index of the value within the collection that describes the `x` position of the `Vector2`
    /// - y: The index of the value within the collection that describes the `y` position of the `Vector2`
    public enum Index: Int, CaseIterable, FixedLengthIndex {
        case x
        case y
    }

    /// The x-coordinate of the point.
    public var x: Scalar

    /// The y-coordinate of the point.
    public var y: Scalar

    /// Access individual elements of the collection via subscript.
    public subscript(position: Index) -> Scalar {
        set {
            switch position {
            case .x: x = newValue
            case .y: y = newValue
            }
        }
        get {
            switch position {
            case .x: return x
            case .y: return y
            }
        }
    }

    /// Initialize to a vector with all elements equal to `scalar`.
    public init(scalar: Scalar) {
        self.init(x: scalar, y: scalar)
    }

    /// Initializes to a vector at given scalar values.
    ///
    /// - Parameters:
    ///   - x: The x-coordinate of the point.
    ///   - y: The y-coordinate of the point.
    public init(x: Scalar, y: Scalar) {
        self.x = x
        self.y = y
    }

}
