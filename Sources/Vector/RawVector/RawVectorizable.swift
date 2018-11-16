import Foundation

/// Protocol of scalar values that are representable in a `Vector2`
public protocol RawVectorizable2 where RawVector2.Element == Self, RawVector2.RawVectorIndex == VectorIndex2 {
    associatedtype RawVector2: RawVector
}

/// Protocol of scalar values that are representable in a `Vector3`
public protocol RawVectorizable3 where RawVector3.Element == Self, RawVector3.RawVectorIndex == VectorIndex3 {
    associatedtype RawVector3: RawVector
}

/// Protocol of scalar values that are representable in a `Vector4`
public protocol RawVectorizable4 where RawVector4.Element == Self, RawVector4.RawVectorIndex == VectorIndex4 {
    associatedtype RawVector4: RawVector
}
