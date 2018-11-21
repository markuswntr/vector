@testable import Vector

extension Vector2 {

    public var xVal: Scalar {
        @_transparent set { _vector[0] = newValue }
        @_transparent get { return _vector[0] }
    }

    public var yVal: Scalar {
        @_transparent set { _vector[1] = newValue }
        @_transparent get { return _vector[1] }
    }
}
