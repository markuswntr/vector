@testable import Vector

extension Vector4 {

    public var xVal: Scalar {
        @_transparent set { _vector[.index0] = newValue }
        @_transparent get { return _vector[.index0] }
    }

    public var yVal: Scalar {
        @_transparent set { _vector[.index1] = newValue }
        @_transparent get { return _vector[.index1] }
    }

    public var zVal: Scalar {
        @_transparent set { _vector[.index2] = newValue }
        @_transparent get { return _vector[.index2] }
    }

    public var wVal: Scalar {
        @_transparent set { _vector[.index3] = newValue }
        @_transparent get { return _vector[.index3] }
    }
}
