@testable import Vector

public struct TestPoint2<Scalar>: Vector2, ExpressibleByArrayLiteral where Scalar: Numeric & RawVectorizable2 {

    /// The underlying optimized vector
    public var _vector: Scalar.RawVector2

    /// Initializes `self` with given vector as underlying optimized vector
    ///
    /// - Parameter vector: The vector to mask behind `self`.
    public init(vector: Scalar.RawVector2) {
        _vector = vector
    }
}

extension TestPoint2 {

    public var xVal: Scalar {
        set { _vector[.index0] = newValue }
        get { return _vector[.index0] }
    }

    public var yVal: Scalar {
        set { _vector[.index1] = newValue }
        get { return _vector[.index1] }
    }
}

extension TestPoint2: Equatable where Vector: Equatable {}
