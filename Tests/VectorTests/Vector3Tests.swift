import XCTest

final class Vector3Tests: XCTestCase {

    func testZeroScalar() {
        let zeroScalar = TestPoint3<Int32>(scalar: 0)
        XCTAssertEqual(zeroScalar, .zero)
    }

    func testZeroCollection() {
        let zeroCollection = TestPoint3<Int32>(sequence: [0, 0, 0])
        XCTAssertEqual(zeroCollection, .zero)
    }

    func testZeroArrayLiteral() {
        let zeroArrayLiteral: TestPoint3<Int32> = [0, 0, 0]
        XCTAssertEqual(zeroArrayLiteral, .zero)
    }

    static var allTests = [
        ("testZeroScalar", testZeroScalar),
        ("testZeroCollection", testZeroCollection),
        ("testZeroArrayLiteral", testZeroArrayLiteral)
    ]
}
