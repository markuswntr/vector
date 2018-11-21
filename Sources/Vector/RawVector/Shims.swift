import Foundation
import VectorShims

// TODO: Are there any different raw types and|or vectors based on arch?

// Check system architecture
#if (arch(i386) || arch(arm)) // 32-bit
public typealias Int = Swift.Int
public typealias UInt = Swift.UInt
#else // 64-bit systems
public typealias Int = Swift.Int32
public typealias UInt = Swift.UInt32
#endif

// MARK: - Int

extension VectorShims.Int2: RawVector {
    public typealias Scalar = Vector.Int
    public typealias RawVectorIndex = VectorIndex2
}
extension VectorShims.Int3: RawVector {
    public typealias Scalar = Vector.Int
    public typealias RawVectorIndex = VectorIndex3
}
extension VectorShims.Int4: RawVector {
    public typealias Scalar = Vector.Int
    public typealias RawVectorIndex = VectorIndex4
}
extension Vector.Int: RawVectorizable2, RawVectorizable3, RawVectorizable4 {
    public typealias RawVector2 = VectorShims.Int2
    public typealias RawVector3 = VectorShims.Int3
    public typealias RawVector4 = VectorShims.Int4
}

// MARK: - UInt

extension VectorShims.UInt2: RawVector {
    public typealias Scalar = Vector.UInt
    public typealias RawVectorIndex = VectorIndex2
}
extension VectorShims.UInt3: RawVector {
    public typealias Scalar = Vector.UInt
    public typealias RawVectorIndex = VectorIndex3
}
extension VectorShims.UInt4: RawVector {
    public typealias Scalar = Vector.UInt
    public typealias RawVectorIndex = VectorIndex4
}
extension Vector.UInt: RawVectorizable2, RawVectorizable3, RawVectorizable4 {
    public typealias RawVector2 = VectorShims.UInt2
    public typealias RawVector3 = VectorShims.UInt3
    public typealias RawVector4 = VectorShims.UInt4
}

// MARK: - Float

extension VectorShims.Float2: RawVector {
    public typealias Scalar = Swift.Float
    public typealias RawVectorIndex = VectorIndex2
}
extension VectorShims.Float3: RawVector {
    public typealias Scalar = Swift.Float
    public typealias RawVectorIndex = VectorIndex3
}
extension VectorShims.Float4: RawVector {
    public typealias Scalar = Swift.Float
    public typealias RawVectorIndex = VectorIndex4
}
extension Swift.Float: RawVectorizable2, RawVectorizable3, RawVectorizable4 {
    public typealias RawVector2 = VectorShims.Float2
    public typealias RawVector3 = VectorShims.Float3
    public typealias RawVector4 = VectorShims.Float4
}

// MARK: - Double

extension VectorShims.Double2: RawVector {
    public typealias Scalar = Swift.Double
    public typealias RawVectorIndex = VectorIndex2
}
extension VectorShims.Double3: RawVector {
    public typealias Scalar = Swift.Double
    public typealias RawVectorIndex = VectorIndex3
}
extension VectorShims.Double4: RawVector {
    public typealias Scalar = Swift.Double
    public typealias RawVectorIndex = VectorIndex4
}
extension Swift.Double: RawVectorizable2, RawVectorizable3, RawVectorizable4 {
    public typealias RawVector2 = VectorShims.Double2
    public typealias RawVector3 = VectorShims.Double3
    public typealias RawVector4 = VectorShims.Double4
}
