import XCTest
@testable import Vector

final class Vector2Tests: XCTestCase {

    func testZeroScalar() {
        let zeroScalar = Vector2<Int32>(repeating: 0)
        XCTAssert(zeroScalar == .zero)
    }

    func testZeroCollection() {
        let zeroCollection = Vector2<Int32>(sequence: [0, 0])
        XCTAssert(zeroCollection == .zero)
    }

    func testZeroArrayLiteral() {
        let zeroArrayLiteral: Vector2<Int32> = [0, 0]
        XCTAssert(zeroArrayLiteral == .zero)
    }

    func testDefaultImplementations() {
        XCTAssertNotNil(Vector2<Int32>(repeating: 2))
        XCTAssertNotNil(Vector2<UInt32>(repeating: 2))
        XCTAssertNotNil(Vector2<Int64>(repeating: 2))
        XCTAssertNotNil(Vector2<UInt64>(repeating: 2))
        XCTAssertNotNil(Vector2<Float>(repeating: 2))
        XCTAssertNotNil(Vector2<Double>(repeating: 2))
    }

    static var allTests = [
        ("testZeroScalar", testZeroScalar),
        ("testZeroCollection", testZeroCollection),
        ("testZeroArrayLiteral", testZeroArrayLiteral),
        ("testDefaultImplementations", testDefaultImplementations)
    ]
}
