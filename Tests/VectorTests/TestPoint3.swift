@testable import Vector

public struct TestPoint3<Scalar>: Vector3, ExpressibleByArrayLiteral where Scalar: Numeric & RawVectorizable3 {

    /// The underlying optimized vector
    public var _vector: Scalar.RawVector3

    /// Initializes `self` with given vector as underlying optimized vector
    ///
    /// - Parameter vector: The vector to mask behind `self`.
    public init(vector: Scalar.RawVector3) {
        _vector = vector
    }
}

extension TestPoint3 {

    public var xVal: Scalar {
        set { _vector[.index0] = newValue }
        get { return _vector[.index0] }
    }

    public var yVal: Scalar {
        set { _vector[.index0] = newValue }
        get { return _vector[.index0] }
    }
}

extension TestPoint3: Equatable where Vector: Equatable {}
