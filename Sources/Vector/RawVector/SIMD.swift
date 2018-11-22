#if canImport(simd)
import Foundation
import simd

// Check system architecture
#if (arch(i386) || arch(arm)) // 32-bit
    public typealias Int = Swift.Int
    public typealias UInt = Swift.UInt
    public typealias Float = Swift.Float
    public typealias Double = Swift.Double
#else // 64-bit systems
    public typealias Int = Swift.Int32
    public typealias UInt = Swift.UInt32
    public typealias Float = Swift.Float
    public typealias Double = Swift.Double
#endif

// MARK: - Int

extension simd.int2: RawVector {
    public typealias Scalar = Vector.Int
}
extension simd.int3: RawVector {
    public typealias Scalar = Vector.Int
}
extension simd.int4: RawVector {
    public typealias Scalar = Vector.Int
}
extension Vector.Int: RawVectorizable2, RawVectorizable3, RawVectorizable4 {
    public typealias RawVector2 = simd.int2
    public typealias RawVector3 = simd.int3
    public typealias RawVector4 = simd.int4
}

// MARK: - UInt

extension simd.uint2: RawVector {
    public typealias Scalar = Vector.UInt
}
extension simd.uint3: RawVector {
    public typealias Scalar = Vector.UInt
}
extension simd.uint4: RawVector {
    public typealias Scalar = Vector.UInt
}
extension Vector.UInt: RawVectorizable2, RawVectorizable3, RawVectorizable4 {
    public typealias RawVector2 = simd.uint2
    public typealias RawVector3 = simd.uint3
    public typealias RawVector4 = simd.uint4
}

// MARK: - Float

extension simd.float2: RawVector {
    public typealias Scalar = Float
}
extension simd.float3: RawVector {
    public typealias Scalar = Float
}
extension simd.float4: RawVector {
    public typealias Scalar = Float
}
extension Float: RawVectorizable2, RawVectorizable3, RawVectorizable4 {
    public typealias RawVector2 = simd.float2
    public typealias RawVector3 = simd.float3
    public typealias RawVector4 = simd.float4
}

// MARK: - Double

extension simd.double2: RawVector {
    public typealias Scalar = Double
}
extension simd.double3: RawVector {
    public typealias Scalar = Double
}
extension simd.double4: RawVector {
    public typealias Scalar = Double
}
extension Double: RawVectorizable2, RawVectorizable3, RawVectorizable4 {
    public typealias RawVector2 = simd.double2
    public typealias RawVector3 = simd.double3
    public typealias RawVector4 = simd.double4
}
#endif /* canImport(simd) */
