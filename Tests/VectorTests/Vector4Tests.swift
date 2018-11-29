import XCTest
@testable import Vector

public struct TestVector4<Scalar>: Vector4, Equatable where Scalar: Numeric & RawVectorizable4, Scalar.RawVector4: Equatable {

    public typealias Index = VectorIndex4
    public typealias Element = Scalar
    public typealias Vector = Element.RawVector4

    /// The underlying optimized vector
    public var _vector: Vector

    /// Initializes `self` with given vector as underlying optimized vector
    ///
    /// - Parameter vector: The vector to mask behind `self`.
    @_transparent public init(vector: Vector) {
        _vector = vector
    }
}

final class Vector4Tests: XCTestCase {

    func testZeroScalar() {
        let zeroScalar = TestVector4<Int32>(repeating: 0)
        XCTAssertEqual(zeroScalar, .zero)
    }

    func testZeroCollection() {
        let zeroCollection = TestVector4<Int32>(sequence: [0, 0, 0, 0])
        XCTAssertEqual(zeroCollection, .zero)
    }

    func testZeroArrayLiteral() {
        let zeroArrayLiteral: TestVector4<Int32> = [0, 0, 0, 0]
        XCTAssertEqual(zeroArrayLiteral, .zero)
    }

    func testDefaultImplementations() {
        XCTAssertNotNil(TestVector4<Int32>(repeating: 4))
        XCTAssertNotNil(TestVector4<UInt32>(repeating: 4))
        XCTAssertNotNil(TestVector4<Float>(repeating: 4))
        XCTAssertNotNil(TestVector4<Double>(repeating: 4))
    }

    static var allTests = [
        ("testZeroScalar", testZeroScalar),
        ("testZeroCollection", testZeroCollection),
        ("testZeroArrayLiteral", testZeroArrayLiteral),
        ("testDefaultImplementations", testDefaultImplementations)
    ]
}
