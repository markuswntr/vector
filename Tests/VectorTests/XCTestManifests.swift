import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Vector2Tests.allTests),
        testCase(Vector3Tests.allTests),
        testCase(Vector4Tests.allTests)
    ]
}
#endif
