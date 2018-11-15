import Foundation

/// Protocol of scalar values that are representable in a Vector2 instance
public protocol SIMDVectorizable2 where _Vector2.Element == Self, _Vector2.VectorIndex == VectorIndex2 {
    associatedtype _Vector2: SIMDVector
}

/// Protocol of scalar values that are representable in a Vector3 instance
public protocol SIMDVectorizable3 where _Vector3.Element == Self, _Vector3.VectorIndex == VectorIndex3 {
    associatedtype _Vector3: SIMDVector
}

/// Protocol of scalar values that are representable in a Vector4 instance
public protocol SIMDVectorizable4 where _Vector4.Element == Self, _Vector4.VectorIndex == VectorIndex4 {
    associatedtype _Vector4: SIMDVector
}
