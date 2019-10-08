import XCTest
@testable import Vector

final class Vector4Tests: XCTestCase {

    func testZeroScalar() {
        let zeroScalar = Vector4<Int32>(repeating: 0)
        XCTAssert(zeroScalar == .zero)
    }

    func testZeroCollection() {
        let zeroCollection = Vector4<Int32>(sequence: [0, 0, 0, 0])
        XCTAssert(zeroCollection == .zero)
    }

    func testZeroArrayLiteral() {
        let zeroArrayLiteral: Vector4<Int32> = [0, 0, 0, 0]
        XCTAssert(zeroArrayLiteral == .zero)
    }

    func testDefaultImplementations() {
        XCTAssertNotNil(Vector4<Int32>(repeating: 4))
        XCTAssertNotNil(Vector4<UInt32>(repeating: 4))
        XCTAssertNotNil(Vector4<Float>(repeating: 4))
    }

    static var allTests = [
        ("testZeroScalar", testZeroScalar),
        ("testZeroCollection", testZeroCollection),
        ("testZeroArrayLiteral", testZeroArrayLiteral),
        ("testDefaultImplementations", testDefaultImplementations)
    ]
}
