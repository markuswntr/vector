import simd

// MARK: - Vector

extension int2: SIMDVector {
    public typealias Scalar = Int32
    public typealias VectorIndex = VectorIndex2
}
extension int3: SIMDVector {
    public typealias Scalar = Int32
    public typealias VectorIndex = VectorIndex3
}
extension int4: SIMDVector {
    public typealias Scalar = Int32
    public typealias VectorIndex = VectorIndex4
}

extension uint2: SIMDVector {
    public typealias Scalar = UInt32
    public typealias VectorIndex = VectorIndex2
}
extension uint3: SIMDVector {
    public typealias Scalar = UInt32
    public typealias VectorIndex = VectorIndex3
}
extension uint4: SIMDVector {
    public typealias Scalar = UInt32
    public typealias VectorIndex = VectorIndex4
}

extension float2: SIMDVector {
    public typealias Scalar = Float
    public typealias VectorIndex = VectorIndex2
}
extension float3: SIMDVector {
    public typealias Scalar = Float
    public typealias VectorIndex = VectorIndex3
}
extension float4: SIMDVector {
    public typealias Scalar = Float
    public typealias VectorIndex = VectorIndex4
}

extension double2: SIMDVector {
    public typealias Scalar = Double
    public typealias VectorIndex = VectorIndex2
}
extension double3: SIMDVector {
    public typealias Scalar = Double
    public typealias VectorIndex = VectorIndex3
}
extension double4: SIMDVector {
    public typealias Scalar = Double
    public typealias VectorIndex = VectorIndex4
}

// MARK: - Scalar

extension Int32: SIMDVectorizable2, SIMDVectorizable3, SIMDVectorizable4 {
    public typealias _Vector2 = int2
    public typealias _Vector3 = int3
    public typealias _Vector4 = int4
}

extension UInt32: SIMDVectorizable2, SIMDVectorizable3, SIMDVectorizable4 {
    public typealias _Vector2 = uint2
    public typealias _Vector3 = uint3
    public typealias _Vector4 = uint4
}

extension Float: SIMDVectorizable2, SIMDVectorizable3, SIMDVectorizable4 {
    public typealias _Vector2 = float2
    public typealias _Vector3 = float3
    public typealias _Vector4 = float4
}

extension Double: SIMDVectorizable2, SIMDVectorizable3, SIMDVectorizable4 {
    public typealias _Vector2 = double2
    public typealias _Vector3 = double3
    public typealias _Vector4 = double4
}
