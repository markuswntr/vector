import Foundation

/// <#Description#>
public struct Vector4<Scalar>: Vector where Scalar: Numeric {

    /// Indices of a `Vector4` are described by `x`, `y`, `z` and `w`, which point to the equivalent value of the `Vector4`
    ///
    /// - x: The index of the value within the collection that describes the `x` position of the `Vector4`
    /// - y: The index of the value within the collection that describes the `y` position of the `Vector4`
    /// - z: The index of the value within the collection that describes the `z` position of the `Vector4`
    /// - w: The index of the value within the collection that describes the `w` position of the `Vector4`
    public enum Index: Int, CaseIterable, FixedLengthIndex {
        case x
        case y
        case z
        case w
    }

    /// The x-coordinate of the point.
    public var x: Scalar

    /// The y-coordinate of the point.
    public var y: Scalar

    /// The z-coordinate of the point.
    public var z: Scalar

    /// The w-coordinate of the point.
    public var w: Scalar

    /// Access individual elements of the collection via subscript.
    public subscript(position: Index) -> Scalar {
        set {
            switch position {
            case .x: x = newValue
            case .y: y = newValue
            case .z: z = newValue
            case .w: w = newValue
            }
        }
        get {
            switch position {
            case .x: return x
            case .y: return y
            case .z: return z
            case .w: return w
            }
        }
    }

    /// Initialize to a vector with all elements equal to `scalar`.
    public init(scalar: Scalar) {
        self.init(x: scalar, y: scalar, z: scalar, w: scalar)
    }

    /// Initializes to a vector at given scalar values.
    ///
    /// - Parameters:
    ///   - x: The x-coordinate of the point.
    ///   - y: The y-coordinate of the point.
    ///   - z: The z-coordinate of the point.
    ///   - w: The w-coordinate of the point.
    public init(x: Scalar, y: Scalar, z: Scalar, w: Scalar) {
        self.x = x
        self.y = y
        self.z = z
        self.w = w
    }
}
