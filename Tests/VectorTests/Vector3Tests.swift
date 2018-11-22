import XCTest
@testable import Vector

final class Vector3Tests: XCTestCase {

    func testZeroScalar() {
        let zeroScalar = Vector3<Int32>(repeating: 0)
        XCTAssertEqual(zeroScalar, .zero)
    }

    func testZeroCollection() {
        let zeroCollection = Vector3<Int32>(sequence: [0, 0, 0])
        XCTAssertEqual(zeroCollection, .zero)
    }

    func testZeroArrayLiteral() {
        let zeroArrayLiteral: Vector3<Int32> = [0, 0, 0]
        XCTAssertEqual(zeroArrayLiteral, .zero)
    }

    func testDefaultImplementations() {
        XCTAssertNotNil(Vector3<Int32>(repeating: 3))
        XCTAssertNotNil(Vector3<UInt32>(repeating: 3))
        XCTAssertNotNil(Vector3<Float>(repeating: 3))
        XCTAssertNotNil(Vector3<Double>(repeating: 3))
    }

    static var allTests = [
        ("testZeroScalar", testZeroScalar),
        ("testZeroCollection", testZeroCollection),
        ("testZeroArrayLiteral", testZeroArrayLiteral),
        ("testDefaultImplementations", testDefaultImplementations)
    ]
}
