@testable import Vector

public struct TestPoint4<Scalar>: Vector4, ExpressibleByArrayLiteral where Scalar: Numeric & RawVectorizable4 {

    /// The underlying optimized vector
    public var _vector: Scalar.RawVector4

    /// Initializes `self` with given vector as underlying optimized vector
    ///
    /// - Parameter vector: The vector to mask behind `self`.
    public init(vector: Scalar.RawVector4) {
        _vector = vector
    }
}

extension TestPoint4 {

    public var xVal: Scalar {
        set { _vector[.index0] = newValue }
        get { return _vector[.index0] }
    }

    public var yVal: Scalar {
        set { _vector[.index0] = newValue }
        get { return _vector[.index0] }
    }
}

extension TestPoint4: Equatable where Vector: Equatable {}
