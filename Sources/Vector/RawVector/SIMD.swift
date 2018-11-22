#if canImport(simd)
import Foundation
import simd

// MARK: - Int

extension simd.int2: RawVector, AdditiveOverflowArithmetic, MultiplicativeOverflowArithmetic {
    public typealias Scalar = Swift.Int32
}
extension simd.int3: RawVector, AdditiveOverflowArithmetic, MultiplicativeOverflowArithmetic {
    public typealias Scalar = Swift.Int32
}
extension simd.int4: RawVector, AdditiveOverflowArithmetic, MultiplicativeOverflowArithmetic {
    public typealias Scalar = Swift.Int32
}
extension Swift.Int32: RawVectorizable2, RawVectorizable3, RawVectorizable4 {
    public typealias RawVector2 = simd.int2
    public typealias RawVector3 = simd.int3
    public typealias RawVector4 = simd.int4
}

// MARK: - UInt

extension simd.uint2: RawVector, AdditiveOverflowArithmetic, MultiplicativeOverflowArithmetic {
    public typealias Scalar = Swift.UInt32
}
extension simd.uint3: RawVector, AdditiveOverflowArithmetic, MultiplicativeOverflowArithmetic {
    public typealias Scalar = Swift.UInt32
}
extension simd.uint4: RawVector, AdditiveOverflowArithmetic, MultiplicativeOverflowArithmetic {
    public typealias Scalar = Swift.UInt32
}
extension Swift.UInt32: RawVectorizable2, RawVectorizable3, RawVectorizable4 {
    public typealias RawVector2 = simd.uint2
    public typealias RawVector3 = simd.uint3
    public typealias RawVector4 = simd.uint4
}

// MARK: - Float

extension simd.float2: RawVector, AdditiveArithmetic, MultiplicativeArithmetic {
    public typealias Scalar = Swift.Float
}
extension simd.float3: RawVector, AdditiveArithmetic, MultiplicativeArithmetic {
    public typealias Scalar = Swift.Float
}
extension simd.float4: RawVector, AdditiveArithmetic, MultiplicativeArithmetic {
    public typealias Scalar = Swift.Float
}
extension Swift.Float: RawVectorizable2, RawVectorizable3, RawVectorizable4 {
    public typealias RawVector2 = simd.float2
    public typealias RawVector3 = simd.float3
    public typealias RawVector4 = simd.float4
}

// MARK: - Double

extension simd.double2: RawVector, AdditiveArithmetic, MultiplicativeArithmetic {
    public typealias Scalar = Swift.Double
}
extension simd.double3: RawVector, AdditiveArithmetic, MultiplicativeArithmetic {
    public typealias Scalar = Swift.Double
}
extension simd.double4: RawVector, AdditiveArithmetic, MultiplicativeArithmetic {
    public typealias Scalar = Swift.Double
}
extension Swift.Double: RawVectorizable2, RawVectorizable3, RawVectorizable4 {
    public typealias RawVector2 = simd.double2
    public typealias RawVector3 = simd.double3
    public typealias RawVector4 = simd.double4
}
#endif /* canImport(simd) */
