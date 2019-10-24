import XCTest
@testable import Vector

final class Vector3Tests: XCTestCase {

    // MARK: Common

    func testRawValueInitializer() {
        let vector: Vector3<Int32> = .init(rawValue: .init(.min, .max, .zero))
        XCTAssertEqual(vector[0], .min)
        XCTAssertEqual(vector[1], .max)
        XCTAssertEqual(vector[2], .zero)
    }

    func testRepeatingInitializer() {
        let vector: Vector3<Float32> = .init(repeating: .pi)
        XCTAssertEqual(vector[0], .pi)
        XCTAssertEqual(vector[1], .pi)
        XCTAssertEqual(vector[2], .pi)
    }

    // MARK: Collection

    func testSequenceInitializer() {
        let vector: Vector3<Int64> = .init(sequence: [.max, .min, .zero])
        XCTAssertEqual(vector[0], .max)
        XCTAssertEqual(vector[1], .min)
        XCTAssertEqual(vector[2], .zero)
    }

    func testSequenceProperties() {
        let vector: Vector3<Int> = .zero
        XCTAssertEqual(vector.count, 3)
        XCTAssertEqual(vector.startIndex, 0)
        XCTAssertEqual(vector.endIndex, 3)
    }

    func testExpressibleByArrayLiteralInitializer() {
        let vector: Vector3<Int> = [.min, .max, .zero]
        XCTAssertEqual(vector[0], .min)
        XCTAssertEqual(vector[1], .max)
        XCTAssertEqual(vector[2], .zero)
    }

    // MARK: Projection

    func testProjectionInitializer() {
        let vector: Vector3<Float64> = .init(x: .greatestFiniteMagnitude, y: .leastNormalMagnitude, z: .leastNonzeroMagnitude)
        XCTAssertEqual(vector[0], .greatestFiniteMagnitude)
        XCTAssertEqual(vector[1], .leastNormalMagnitude)
        XCTAssertEqual(vector[2], .leastNonzeroMagnitude)
    }

    func testProjectionProperties() {
        let vector: Vector3<Int8> = [.min, .max, .zero]
        XCTAssertEqual(vector.projection.x, .min)
        XCTAssertEqual(vector.projection.y, .max)
        XCTAssertEqual(vector.projection.z, .zero)
    }

    func testProjectionEquatable() {
        let lhs: Vector3<Int> = [.min, .max, .zero]
        let rhs: Vector3<Int> = [.min, .max, .zero]
        XCTAssert(lhs.projection == rhs.projection)

        let inverted: Vector3<Int> = [.max, .min, .zero]
        XCTAssert(lhs.projection != inverted.projection)
    }

    // MARK: Numerics

    func testEquatable() {
        let lhs: Vector3<Int> = [.min, 640, .zero]
        let rhs: Vector3<Int> = [.min, 640, .zero]
        XCTAssert(lhs == rhs)

        let inverted: Vector3<Int> = [640, .min, .zero]
        XCTAssert(lhs == inverted) // !!!
    }

    func testComparable() {
        let lhs: Vector3<Int> = [640 - 1, 203, .zero]
        let rhs: Vector3<Int> = [640, 203, .zero]
        XCTAssert(lhs < rhs)
        XCTAssert(rhs > lhs)
        XCTAssertFalse(lhs > rhs)

        let inverted: Vector3<Int> = [203, 640 - 1, .zero]
        XCTAssert(lhs == inverted)
        XCTAssert(inverted < rhs)
    }

    func testZeroFixedWidthIntegerVector() {
        let zeroVector: Vector3<Int> = .zero
        XCTAssertEqual(zeroVector[0], .zero)
        XCTAssertEqual(zeroVector[1], .zero)
        XCTAssertEqual(zeroVector[2], .zero)
    }

    func testZeroFloatingPointVector() {
        let zeroVector: Vector3<Float32> = .zero
        XCTAssertEqual(zeroVector[0], .zero)
        XCTAssertEqual(zeroVector[1], .zero)
        XCTAssertEqual(zeroVector[2], .zero)
    }

    func testAddFixedWidthIntegerVector() {
        let lhs: Vector3<Int> = [2, 4, -8]
        let rhs: Vector3<Int> = [4, -2, -8]
        let addVector = lhs &+ rhs
        XCTAssertEqual(addVector[0], 6)
        XCTAssertEqual(addVector[1], 2)
        XCTAssertEqual(addVector[2], -16)
    }

    func testAddFloatingPointVector() {
        let lhs: Vector3<Float32> = [2, 4, -8]
        let rhs: Vector3<Float32> = [4, -2, -8]
        let addVector = lhs + rhs
        XCTAssertEqual(addVector[0], 6)
        XCTAssertEqual(addVector[1], 2)
        XCTAssertEqual(addVector[2], -16)
    }

    func testMagnitudeSquaredFixedWidthIntegerVector() {
        let vector: Vector3<Int> = [3, 4, 5]
        let squared = vector.magnitudeSquared()
        XCTAssertEqual(squared, 50)
    }

    func testMagnitudeSquaredFloatinPointVector() {
        let vector: Vector3<Float32> = [3, 4, 5]
        let squared = vector.magnitudeSquared()
        XCTAssertEqual(squared, 50)
    }

    func testMagnitudeFixedWidthIntegerVector() {
        let vector: Vector3<Int> = [3, 4, 5]
        let magnitude: Double = vector.magnitude()
        XCTAssertEqual(magnitude, sqrt(50))
    }

    func testMagnitudeFloatinPointVector() {
        let vector: Vector3<Float32> = [3, 4, 5]
        let magnitude = vector.magnitude()
        XCTAssertEqual(magnitude, sqrt(50))
    }

    func testNumericAvailability() {
        XCTAssertNotNil(Vector3<Int8>(repeating: 2))
        XCTAssertNotNil(Vector3<Int16>(repeating: 2))
        XCTAssertNotNil(Vector3<Int32>(repeating: 2))
        XCTAssertNotNil(Vector3<Int64>(repeating: 2))

        XCTAssertNotNil(Vector3<UInt8>(repeating: 2))
        XCTAssertNotNil(Vector3<UInt16>(repeating: 2))
        XCTAssertNotNil(Vector3<UInt32>(repeating: 2))
        XCTAssertNotNil(Vector3<UInt64>(repeating: 2))

        XCTAssertNotNil(Vector3<Float32>(repeating: 2))
        XCTAssertNotNil(Vector3<Float64>(repeating: 2))
    }

    static var allTests = [
        ("testRawValueInitializer", testRawValueInitializer),
        ("testRepeatingInitializer", testRepeatingInitializer),
        ("testSequenceInitializer", testSequenceInitializer),
        ("testSequenceProperties", testSequenceProperties),
        ("testExpressibleByArrayLiteralInitializer", testExpressibleByArrayLiteralInitializer),
        ("testProjectionInitializer", testProjectionInitializer),
        ("testProjectionProperties", testProjectionProperties),
        ("testProjectionEquatable", testProjectionEquatable),
        ("testEquatable", testEquatable),
        ("testComparable", testComparable),
        ("testZeroFixedWidthIntegerVector", testZeroFixedWidthIntegerVector),
        ("testZeroFloatingPointVector", testZeroFloatingPointVector),
        ("testAddFixedWidthIntegerVector", testAddFixedWidthIntegerVector),
        ("testAddFloatingPointVector", testAddFloatingPointVector),
        ("testMagnitudeSquaredFixedWidthIntegerVector", testMagnitudeSquaredFixedWidthIntegerVector),
        ("testMagnitudeSquaredFloatinPointVector", testMagnitudeSquaredFloatinPointVector),
        ("testMagnitudeFixedWidthIntegerVector", testMagnitudeFixedWidthIntegerVector),
        ("testMagnitudeFloatinPointVector", testMagnitudeFloatinPointVector),
        ("testNumericAvailability", testNumericAvailability)
    ]
}
