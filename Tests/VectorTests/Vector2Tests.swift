import XCTest
@testable import Vector

final class Vector2Tests: XCTestCase {

    // MARK: Common

    func testRawValueInitializer() {
        let vector: Vector2<Int32> = .init(rawValue: .init(.min, .max))
        XCTAssertEqual(vector[0], .min)
        XCTAssertEqual(vector[1], .max)
    }

    func testRepeatingInitializer() {
        let vector: Vector2<Float32> = .init(repeating: .pi)
        XCTAssertEqual(vector[0], .pi)
        XCTAssertEqual(vector[1], .pi)
    }

    // MARK: Collection

    func testSequenceInitializer() {
        let vector: Vector2<Int64> = .init(sequence: [.max, .min])
        XCTAssertEqual(vector[0], .max)
        XCTAssertEqual(vector[1], .min)
    }

    func testSequenceProperties() {
        let vector: Vector2<Int> = .zero
        XCTAssertEqual(vector.count, 2)
        XCTAssertEqual(vector.startIndex, 0)
        XCTAssertEqual(vector.endIndex, 2)
    }

    func testExpressibleByArrayLiteralInitializer() {
        let vector: Vector2<Int> = [.min, .max]
        XCTAssertEqual(vector[0], .min)
        XCTAssertEqual(vector[1], .max)
    }

    // MARK: Projection

    func testProjectionInitializer() {
        let vector: Vector2<Float64> = .init(x: .greatestFiniteMagnitude, y: .leastNormalMagnitude)
        XCTAssertEqual(vector[0], .greatestFiniteMagnitude)
        XCTAssertEqual(vector[1], .leastNormalMagnitude)
    }

    func testProjectionProperties() {
        let vector: Vector2<Int8> = .init(rawValue: .init(.min, .max))
        XCTAssertEqual(vector.projection.x, .min)
        XCTAssertEqual(vector.projection.y, .max)
    }

    func testProjectionEquatable() {
        let lhs: Vector2<Int> = [.min, .max]
        let rhs: Vector2<Int> = [.min, .max]
        XCTAssert(lhs.projection == rhs.projection)

        let inverted: Vector2<Int> = [.max, .min]
        XCTAssert(lhs.projection != inverted.projection)
    }

    // MARK: Numerics

    func testNumericAvailability() {
        XCTAssertNotNil(Vector2<Int8>(repeating: 2))
        XCTAssertNotNil(Vector2<Int16>(repeating: 2))
        XCTAssertNotNil(Vector2<Int32>(repeating: 2))
        XCTAssertNotNil(Vector2<Int64>(repeating: 2))

        XCTAssertNotNil(Vector2<UInt8>(repeating: 2))
        XCTAssertNotNil(Vector2<UInt16>(repeating: 2))
        XCTAssertNotNil(Vector2<UInt32>(repeating: 2))
        XCTAssertNotNil(Vector2<UInt64>(repeating: 2))

        XCTAssertNotNil(Vector2<Float32>(repeating: 2))
        XCTAssertNotNil(Vector2<Float64>(repeating: 2))
    }

    func testEquatable() {
        let lhs: Vector2<Int> = [.min, 640]
        let rhs: Vector2<Int> = [.min, 640]
        XCTAssert(lhs == rhs)

        let inverted: Vector2<Int> = [640, .min]
        XCTAssert(lhs == inverted) // !!!
    }

    func testComparable() {
        let lhs: Vector2<Int> = [640 - 1, 203]
        let rhs: Vector2<Int> = [640, 203]
        XCTAssert(lhs < rhs)
        XCTAssert(rhs > lhs)
        XCTAssertFalse(lhs > rhs)

        let inverted: Vector2<Int> = [203, 640 - 1]
        XCTAssert(lhs == inverted)
        XCTAssert(inverted < rhs)
    }

    func testZeroFixedWidthIntegerVector() {
        let zeroVector: Vector2<Int> = .zero
        XCTAssertEqual(zeroVector[0], .zero)
        XCTAssertEqual(zeroVector[1], .zero)
    }

    func testZeroFloatingPointVector() {
        let zeroVector: Vector2<Float32> = .zero
        XCTAssertEqual(zeroVector[0], .zero)
        XCTAssertEqual(zeroVector[1], .zero)
    }

    func testAddFixedWidthIntegerVector() {
        let addVector: Vector2<Int> = [2, 5] &+ [4, -3]
        XCTAssertEqual(addVector[0], 6)
        XCTAssertEqual(addVector[1], 2)
    }

    func testAddFloatingPointVector() {
        let addVector: Vector2<Float32> = [2, 5] + [4, -3]
        XCTAssertEqual(addVector[0], 6)
        XCTAssertEqual(addVector[1], 2)
    }

    func testSubFixedWidthIntegerVector() {
        let subVector: Vector2<Int> = [2, 5] &- [4, -3]
        XCTAssertEqual(subVector[0], -2)
        XCTAssertEqual(subVector[1], 8)
    }

    func testSubFloatingPointVector() {
        let subVector: Vector2<Float32> = [2, 5] - [4, -3]
        XCTAssertEqual(subVector[0], -2)
        XCTAssertEqual(subVector[1], 8)
    }

    func testScaleFixedWidthIntegerVector() {
        var scaleVector: Vector2<Int> = [2, 5]
        scaleVector.scale(by: 2)
        XCTAssertEqual(scaleVector[0], 4)
        XCTAssertEqual(scaleVector[1], 10)

        let scaledVector = scaleVector.scaled(by: 3)
        XCTAssertEqual(scaledVector[0], 12)
        XCTAssertEqual(scaledVector[1], 30)

        var operatorVector: Vector2<Int> = [2, 5]
        operatorVector = operatorVector &* 2
        XCTAssertEqual(operatorVector[0], 4)
        XCTAssertEqual(operatorVector[1], 10)

        operatorVector &*= 3
        XCTAssertEqual(operatorVector[0], 12)
        XCTAssertEqual(operatorVector[1], 30)
    }

    func testScaleFloatingPointVector() {
        var scaleVector: Vector2<Float64> = [2, 5]
        scaleVector.scale(by: 2)
        XCTAssertEqual(scaleVector[0], 4)
        XCTAssertEqual(scaleVector[1], 10)

        let scaledVector = scaleVector.scaled(by: 3)
        XCTAssertEqual(scaledVector[0], 12)
        XCTAssertEqual(scaledVector[1], 30)

        var multiplyOperatorVector: Vector2<Float64> = [2, 5]
        multiplyOperatorVector = multiplyOperatorVector * 2
        XCTAssertEqual(multiplyOperatorVector[0], 4)
        XCTAssertEqual(multiplyOperatorVector[1], 10)

        multiplyOperatorVector *= 3
        XCTAssertEqual(multiplyOperatorVector[0], 12)
        XCTAssertEqual(multiplyOperatorVector[1], 30)

        var divisionOperatorVector: Vector2<Float64> = [12, 30]
        divisionOperatorVector = divisionOperatorVector / 2
        XCTAssertEqual(divisionOperatorVector[0], 6)
        XCTAssertEqual(divisionOperatorVector[1], 15)

        divisionOperatorVector /= 3
        XCTAssertEqual(divisionOperatorVector[0], 2)
        XCTAssertEqual(divisionOperatorVector[1], 5)
    }

    func testMagnitudeSquaredFixedWidthIntegerVector() {
        let vector: Vector2<Int> = [3, 4]
        let squared = vector.magnitudeSquared()
        XCTAssertEqual(squared, (3*3 + 4*4))
    }

    func testMagnitudeSquaredFloatinPointVector() {
        let vector: Vector2<Float32> = [3, 4]
        let squared = vector.magnitudeSquared()
        XCTAssertEqual(squared, 3*3 + 4*4)
    }

    func testMagnitudeFixedWidthIntegerVector() {
        let vector: Vector2<Int> = [3, 4]
        let magnitude: Double = vector.magnitude()
        XCTAssertEqual(magnitude, 5)
    }

    func testMagnitudeFloatinPointVector() {
        let vector: Vector2<Float32> = [3, 4]
        let magnitude = vector.magnitude()
        XCTAssertEqual(magnitude, 5)
    }

    func testNormalizeFloatinPointVector() {
        var vector: Vector2<Float32> = [3, 4]
        let unit = vector.normalized()
        XCTAssertEqual(unit.magnitude(), 1)
        vector.normalize(to: 1000)
        XCTAssertEqual(vector.magnitude(), 1000)
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
        ("testAddFixedWidthIntegerVector", testAddFixedWidthIntegerVector),
        ("testAddFloatingPointVector", testAddFloatingPointVector),
        ("testSubFixedWidthIntegerVector", testSubFixedWidthIntegerVector),
        ("testSubFloatingPointVector", testSubFloatingPointVector),
        ("testScaleFixedWidthIntegerVector", testScaleFixedWidthIntegerVector),
        ("testScaleFloatingPointVector", testScaleFloatingPointVector),
        ("testMagnitudeSquaredFixedWidthIntegerVector", testMagnitudeSquaredFixedWidthIntegerVector),
        ("testMagnitudeSquaredFloatinPointVector", testMagnitudeSquaredFloatinPointVector),
        ("testMagnitudeFixedWidthIntegerVector", testMagnitudeFixedWidthIntegerVector),
        ("testMagnitudeFloatinPointVector", testMagnitudeFloatinPointVector),
        ("testNormalizeFloatinPointVector", testNormalizeFloatinPointVector),
    ]
}
