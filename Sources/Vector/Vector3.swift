import Foundation

/// <#Description#>
public struct Vector3<Scalar>: Vector, ExpressibleByArrayLiteral where Scalar: Numeric {

    /// Indices of a `Vector3` are described by `x`, `y` and `z`, which point to the equivalent value of the `Vector3`
    ///
    /// - x: The index of the value within the collection that describes the `x` position of the `Vector3`
    /// - y: The index of the value within the collection that describes the `y` position of the `Vector3`
    /// - z: The index of the value within the collection that describes the `z` position of the `Vector3`
    public enum Index: Int, CaseIterable, FixedLengthIndex {
        case x, y, z
    }

    /// The x-coordinate of the point.
    public var x: Scalar

    /// The y-coordinate of the point.
    public var y: Scalar

    /// The z-coordinate of the point.
    public var z: Scalar

    /// Initialize to a vector with all elements equal to `scalar`.
    public init(scalar: Scalar) {
        self.init(x: scalar, y: scalar, z: scalar)
    }

    /// Initializes to a vector at given scalar values.
    ///
    /// - Parameters:
    ///   - x: The x-coordinate of the point.
    ///   - y: The y-coordinate of the point.
    ///   - z: The z-coordinate of the point.
    public init(x: Scalar, y: Scalar, z: Scalar) {
        self.x = x
        self.y = y
        self.z = z
    }
}

// MARK: - Subscript

extension Vector3 {

    /// Access individual elements of the collection via subscript.
    public subscript(position: Index) -> Scalar {
        set {
            switch position {
            case .x: x = newValue
            case .y: y = newValue
            case .z: z = newValue
            }
        }
        get {
            switch position {
            case .x: return x
            case .y: return y
            case .z: return z
            }
        }
    }
}
