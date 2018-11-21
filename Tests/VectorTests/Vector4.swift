@testable import Vector

extension Vector4 {

    public var xVal: Scalar {
        @_transparent set { _vector[0] = newValue }
        @_transparent get { return _vector[0] }
    }

    public var yVal: Scalar {
        @_transparent set { _vector[1] = newValue }
        @_transparent get { return _vector[1] }
    }

    public var zVal: Scalar {
        @_transparent set { _vector[2] = newValue }
        @_transparent get { return _vector[2] }
    }

    public var wVal: Scalar {
        @_transparent set { _vector[3] = newValue }
        @_transparent get { return _vector[3] }
    }
}
