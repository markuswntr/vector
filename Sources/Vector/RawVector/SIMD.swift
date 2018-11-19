import Foundation
#if canImport(simd)
import simd

// MARK: - Vector

extension int2: RawVector {
    public typealias Scalar = Int32
    public typealias RawVectorIndex = VectorIndex2
}
extension int3: RawVector {
    public typealias Scalar = Int32
    public typealias RawVectorIndex = VectorIndex3
}
extension int4: RawVector {
    public typealias Scalar = Int32
    public typealias RawVectorIndex = VectorIndex4
}

extension uint2: RawVector {
    public typealias Scalar = UInt32
    public typealias RawVectorIndex = VectorIndex2
}
extension uint3: RawVector {
    public typealias Scalar = UInt32
    public typealias RawVectorIndex = VectorIndex3
}
extension uint4: RawVector {
    public typealias Scalar = UInt32
    public typealias RawVectorIndex = VectorIndex4
}

extension float2: RawVector {
    public typealias Scalar = Float
    public typealias RawVectorIndex = VectorIndex2
}
extension float3: RawVector {
    public typealias Scalar = Float
    public typealias RawVectorIndex = VectorIndex3
}
extension float4: RawVector {
    public typealias Scalar = Float
    public typealias RawVectorIndex = VectorIndex4
}

extension double2: RawVector {
    public typealias Scalar = Double
    public typealias RawVectorIndex = VectorIndex2
}
extension double3: RawVector {
    public typealias Scalar = Double
    public typealias RawVectorIndex = VectorIndex3
}
extension double4: RawVector {
    public typealias Scalar = Double
    public typealias RawVectorIndex = VectorIndex4
}

// MARK: - Scalar

extension Int32: RawVectorizable2, RawVectorizable3, RawVectorizable4 {
    public typealias RawVector2 = int2
    public typealias RawVector3 = int3
    public typealias RawVector4 = int4
}

extension UInt32: RawVectorizable2, RawVectorizable3, RawVectorizable4 {
    public typealias RawVector2 = uint2
    public typealias RawVector3 = uint3
    public typealias RawVector4 = uint4
}

extension Float: RawVectorizable2, RawVectorizable3, RawVectorizable4 {
    public typealias RawVector2 = float2
    public typealias RawVector3 = float3
    public typealias RawVector4 = float4
}

extension Double: RawVectorizable2, RawVectorizable3, RawVectorizable4 {
    public typealias RawVector2 = double2
    public typealias RawVector3 = double3
    public typealias RawVector4 = double4
}

#else
#error("not yet supported target hardware")
#endif
