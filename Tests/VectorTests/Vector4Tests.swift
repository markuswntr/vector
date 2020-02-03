import XCTest
@testable import Vector

final class Vector4Tests: XCTestCase {

    // MARK: Common

    func testRawValueInitializer() {
        let vector: Vector4<Int32> = .init(rawValue: .init(.min, .max, .zero, .max))
        XCTAssertEqual(vector[0], .min)
        XCTAssertEqual(vector[1], .max)
        XCTAssertEqual(vector[2], .zero)
        XCTAssertEqual(vector[3], .max)
    }

    func testRepeatingInitializer() {
        let vector: Vector4<Float32> = .init(repeating: .pi)
        XCTAssertEqual(vector[0], .pi)
        XCTAssertEqual(vector[1], .pi)
        XCTAssertEqual(vector[2], .pi)
        XCTAssertEqual(vector[3], .pi)
    }

    // MARK: Collection

    func testSequenceInitializer() {
        let vector: Vector4<Int64> = .init(sequence: [.max, .min, .zero, .max])
        XCTAssertEqual(vector[0], .max)
        XCTAssertEqual(vector[1], .min)
        XCTAssertEqual(vector[2], .zero)
        XCTAssertEqual(vector[3], .max)
    }

    func testSequenceProperties() {
        let vector: Vector4<Int> = .zero
        XCTAssertEqual(vector.count, 4)
        XCTAssertEqual(vector.startIndex, 0)
        XCTAssertEqual(vector.endIndex, 4)
    }

    func testExpressibleByArrayLiteralInitializer() {
        let vector: Vector4<Int> = [.min, .max, .zero, .min]
        XCTAssertEqual(vector[0], .min)
        XCTAssertEqual(vector[1], .max)
        XCTAssertEqual(vector[2], .zero)
        XCTAssertEqual(vector[3], .min)
    }

    // MARK: Projection

    func testProjectionInitializer() {
        let vector: Vector4<Float64> = .init(
            x: .greatestFiniteMagnitude, y: .leastNormalMagnitude, z: .leastNonzeroMagnitude, w: .ulpOfOne)
        XCTAssertEqual(vector[0], .greatestFiniteMagnitude)
        XCTAssertEqual(vector[1], .leastNormalMagnitude)
        XCTAssertEqual(vector[2], .leastNonzeroMagnitude)
        XCTAssertEqual(vector[3], .ulpOfOne)
    }

    func testProjectionProperties() {
        let vector: Vector4<Int8> = [.min, .max, .zero, .min]
        XCTAssertEqual(vector.projection.x, .min)
        XCTAssertEqual(vector.projection.y, .max)
        XCTAssertEqual(vector.projection.z, .zero)
        XCTAssertEqual(vector.projection.w, .min)
    }

    func testProjectionEquatable() {
        let lhs: Vector4<Int> = [.min, .max, .zero, .max]
        let rhs: Vector4<Int> = [.min, .max, .zero, .max]
        XCTAssert(lhs.projection == rhs.projection)

        let inverted: Vector4<Int> = [.max, .min, .zero, .min]
        XCTAssert(lhs.projection != inverted.projection)
    }

    // MARK: Numerics

    func testNumericAvailability() {
        XCTAssertNotNil(Vector4<Int8>(repeating: 2))
        XCTAssertNotNil(Vector4<Int16>(repeating: 2))
        XCTAssertNotNil(Vector4<Int32>(repeating: 2))
        XCTAssertNotNil(Vector4<Int64>(repeating: 2))

        XCTAssertNotNil(Vector4<UInt8>(repeating: 2))
        XCTAssertNotNil(Vector4<UInt16>(repeating: 2))
        XCTAssertNotNil(Vector4<UInt32>(repeating: 2))
        XCTAssertNotNil(Vector4<UInt64>(repeating: 2))

        XCTAssertNotNil(Vector4<Float32>(repeating: 2))
        XCTAssertNotNil(Vector4<Float64>(repeating: 2))
    }

    func testEquatable() {
        let lhs: Vector4<Int> = [.min, 640, .zero, 256]
        let rhs: Vector4<Int> = [.min, 640, .zero, 256]
        XCTAssert(lhs == rhs)

        let inverted: Vector4<Int> = [640, .min, .zero, 256]
        XCTAssert(lhs == inverted) // !!!
    }

    func testComparable() {
        let lhs: Vector4<Int> = [640 - 1, 203, .zero, 256]
        let rhs: Vector4<Int> = [640, 203, .zero, 256]
        XCTAssert(lhs < rhs)
        XCTAssert(rhs > lhs)
        XCTAssertFalse(lhs > rhs)

        let inverted: Vector4<Int> = [203, 640 - 1, .zero, 256]
        XCTAssert(lhs == inverted)
        XCTAssert(inverted < rhs)
    }

    func testZeroFixedWidthIntegerVector() {
        let zeroVector: Vector4<Int> = .zero
        XCTAssertEqual(zeroVector[0], .zero)
        XCTAssertEqual(zeroVector[1], .zero)
        XCTAssertEqual(zeroVector[2], .zero)
        XCTAssertEqual(zeroVector[3], .zero)
    }

    func testZeroFloatingPointVector() {
        let zeroVector: Vector4<Float32> = .zero
        XCTAssertEqual(zeroVector[0], .zero)
        XCTAssertEqual(zeroVector[1], .zero)
        XCTAssertEqual(zeroVector[2], .zero)
        XCTAssertEqual(zeroVector[3], .zero)
    }

    func testMagnitudeSquaredFixedWidthIntegerVector() {
        let vector: Vector4<Int> = [3, 4, 5, 6]
        let squared = vector.magnitudeSquared()
        XCTAssertEqual(squared, 86)
    }

    func testMagnitudeSquaredFloatinPointVector() {
        let vector: Vector4<Float32> = [3, 4, 5, 6]
        let squared = vector.magnitudeSquared()
        XCTAssertEqual(squared, 86)
    }

    func testMagnitudeFixedWidthIntegerVector() {
        let vector: Vector4<Int> = [3, 4, 5, 6]
        let magnitude: Double = vector.magnitude()
        XCTAssertEqual(magnitude, sqrt(86))
    }

    func testMagnitudeFloatinPointVector() {
        let vector: Vector4<Float32> = [3, 4, 5, 6]
        let magnitude: Float32 = vector.magnitude()
        XCTAssertEqual(magnitude, sqrt(86))
    }

    func testAddFixedWidthIntegerVector() {
        let lhs: Vector4<Int> = [2, 4, -8, -16]
        let rhs: Vector4<Int> = [4, -2, -8, 16]
        let addVector = lhs &+ rhs
        XCTAssertEqual(addVector[0], 6)
        XCTAssertEqual(addVector[1], 2)
        XCTAssertEqual(addVector[2], -16)
        XCTAssertEqual(addVector[3], .zero)
    }

    func testAddFloatingPointVector() {
        let lhs: Vector4<Int> = [2, 4, -8, -16]
        let rhs: Vector4<Int> = [4, -2, -8, 16]
        let addVector = lhs &+ rhs
        XCTAssertEqual(addVector[0], 6)
        XCTAssertEqual(addVector[1], 2)
        XCTAssertEqual(addVector[2], -16)
        XCTAssertEqual(addVector[3], .zero)
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
        ("testNumericAvailability", testNumericAvailability),
        ("testEquatable", testEquatable),
        ("testComparable", testComparable),
        ("testZeroFixedWidthIntegerVector", testZeroFixedWidthIntegerVector),
        ("testZeroFloatingPointVector", testZeroFloatingPointVector),
        ("testMagnitudeSquaredFixedWidthIntegerVector", testMagnitudeSquaredFixedWidthIntegerVector),
        ("testMagnitudeSquaredFloatinPointVector", testMagnitudeSquaredFloatinPointVector),
        ("testMagnitudeFixedWidthIntegerVector", testMagnitudeFixedWidthIntegerVector),
        ("testMagnitudeFloatinPointVector", testMagnitudeFloatinPointVector),
        ("testAddFixedWidthIntegerVector", testAddFixedWidthIntegerVector),
        ("testAddFloatingPointVector", testAddFloatingPointVector),
    ]
}
