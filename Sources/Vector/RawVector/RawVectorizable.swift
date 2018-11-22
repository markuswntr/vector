import Foundation

/// Protocol of scalar values that are representable in a `Vector2`
public protocol RawVectorizable2 where RawVector2.Element == Self {
    associatedtype RawVector2: Vector.RawVector2
}

/// Protocol of scalar values that are representable in a `Vector3`
public protocol RawVectorizable3 where RawVector3.Element == Self {
    associatedtype RawVector3: Vector.RawVector3
}

/// Protocol of scalar values that are representable in a `Vector4`
public protocol RawVectorizable4 where RawVector4.Element == Self {
    associatedtype RawVector4: Vector.RawVector4
}
