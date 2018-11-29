import XCTest
@testable import Vector

public struct TestVector2<Scalar>: Vector2, Equatable where Scalar: Numeric & RawVectorizable2, Scalar.RawVector2: Equatable {

    public typealias Index = VectorIndex2
    public typealias Element = Scalar
    public typealias Vector = Element.RawVector2

    /// The underlying optimized vector
    public var _vector: Vector

    /// Initializes `self` with given vector as underlying optimized vector
    ///
    /// - Parameter vector: The vector to mask behind `self`.
    @_transparent public init(vector: Vector) {
        _vector = vector
    }
}

final class Vector2Tests: XCTestCase {

    func testZeroScalar() {
        let zeroScalar = TestVector2<Int32>(repeating: 0)
        XCTAssertEqual(zeroScalar, .zero)
    }

    func testZeroCollection() {
        let zeroCollection = TestVector2<Int32>(sequence: [0, 0])
        XCTAssertEqual(zeroCollection, .zero)
    }

    func testZeroArrayLiteral() {
        let zeroArrayLiteral: TestVector2<Int32> = [0, 0]
        XCTAssertEqual(zeroArrayLiteral, .zero)
    }

    func testDefaultImplementations() {
        XCTAssertNotNil(TestVector2<Int32>(repeating: 2))
        XCTAssertNotNil(TestVector2<UInt32>(repeating: 2))
        XCTAssertNotNil(TestVector2<Float>(repeating: 2))
        XCTAssertNotNil(TestVector2<Double>(repeating: 2))
    }

    static var allTests = [
        ("testZeroScalar", testZeroScalar),
        ("testZeroCollection", testZeroCollection),
        ("testZeroArrayLiteral", testZeroArrayLiteral),
        ("testDefaultImplementations", testDefaultImplementations)
    ]
}
