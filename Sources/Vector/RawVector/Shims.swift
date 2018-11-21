import Foundation
import VectorShims

// MARK: - Int

extension VectorShims.Int2: RawVector {
    public typealias Scalar = Int32
    public typealias RawVectorIndex = VectorIndex2
}
extension VectorShims.Int3: RawVector {
    public typealias Scalar = Int32
    public typealias RawVectorIndex = VectorIndex3
}
extension VectorShims.Int4: RawVector {
    public typealias Scalar = Int32
    public typealias RawVectorIndex = VectorIndex4
}
extension Int32: RawVectorizable2, RawVectorizable3, RawVectorizable4 {
    public typealias RawVector2 = VectorShims.Int2
    public typealias RawVector3 = VectorShims.Int3
    public typealias RawVector4 = VectorShims.Int4
}

// MARK: - UInt

extension VectorShims.UInt2: RawVector {
    public typealias Scalar = UInt32
    public typealias RawVectorIndex = VectorIndex2
}
extension VectorShims.UInt3: RawVector {
    public typealias Scalar = UInt32
    public typealias RawVectorIndex = VectorIndex3
}
extension VectorShims.UInt4: RawVector {
    public typealias Scalar = UInt32
    public typealias RawVectorIndex = VectorIndex4
}
extension UInt32: RawVectorizable2, RawVectorizable3, RawVectorizable4 {
    public typealias RawVector2 = VectorShims.UInt2
    public typealias RawVector3 = VectorShims.UInt3
    public typealias RawVector4 = VectorShims.UInt4
}

// MARK: - Float

extension VectorShims.Float2: RawVector {
    public typealias Scalar = Float
    public typealias RawVectorIndex = VectorIndex2
}
extension VectorShims.Float3: RawVector {
    public typealias Scalar = Float
    public typealias RawVectorIndex = VectorIndex3
}
extension VectorShims.Float4: RawVector {
    public typealias Scalar = Float
    public typealias RawVectorIndex = VectorIndex4
}
extension Float: RawVectorizable2, RawVectorizable3, RawVectorizable4 {
    public typealias RawVector2 = VectorShims.Float2
    public typealias RawVector3 = VectorShims.Float3
    public typealias RawVector4 = VectorShims.Float4
}

// MARK: - Double

extension VectorShims.Double2: RawVector {
    public typealias Scalar = Double
    public typealias RawVectorIndex = VectorIndex2
}
extension VectorShims.Double3: RawVector {
    public typealias Scalar = Double
    public typealias RawVectorIndex = VectorIndex3
}
extension VectorShims.Double4: RawVector {
    public typealias Scalar = Double
    public typealias RawVectorIndex = VectorIndex4
}
extension Double: RawVectorizable2, RawVectorizable3, RawVectorizable4 {
    public typealias RawVector2 = VectorShims.Double2
    public typealias RawVector3 = VectorShims.Double3
    public typealias RawVector4 = VectorShims.Double4
}
