import XCTest
@testable import Vector

public struct TestVector3<Scalar>: Vector3, Equatable where Scalar: Numeric & RawVectorizable3, Scalar.RawVector3: Equatable {

    public typealias Index = VectorIndex3
    public typealias Element = Scalar
    public typealias Vector = Element.RawVector3

    /// The underlying optimized vector
    public var _vector: Vector

    /// Initializes `self` with given vector as underlying optimized vector
    ///
    /// - Parameter vector: The vector to mask behind `self`.
    @_transparent public init(vector: Vector) {
        _vector = vector
    }
}

final class Vector3Tests: XCTestCase {

    func testZeroScalar() {
        let zeroScalar = TestVector3<Int32>(repeating: 0)
        XCTAssertEqual(zeroScalar, .zero)
    }

    func testZeroCollection() {
        let zeroCollection = TestVector3<Int32>(sequence: [0, 0, 0])
        XCTAssertEqual(zeroCollection, .zero)
    }

    func testZeroArrayLiteral() {
        let zeroArrayLiteral: TestVector3<Int32> = [0, 0, 0]
        XCTAssertEqual(zeroArrayLiteral, .zero)
    }

    func testDefaultImplementations() {
        XCTAssertNotNil(TestVector3<Int32>(repeating: 3))
        XCTAssertNotNil(TestVector3<UInt32>(repeating: 3))
        XCTAssertNotNil(TestVector3<Float>(repeating: 3))
        XCTAssertNotNil(TestVector3<Double>(repeating: 3))
    }

    static var allTests = [
        ("testZeroScalar", testZeroScalar),
        ("testZeroCollection", testZeroCollection),
        ("testZeroArrayLiteral", testZeroArrayLiteral),
        ("testDefaultImplementations", testDefaultImplementations)
    ]
}
