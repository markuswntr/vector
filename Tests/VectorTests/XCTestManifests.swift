import XCTest

#if !os(macOS) && !os(iOS) && !os(tvOS) && !os(watchOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Vector2Tests.allTests),
        testCase(Vector3Tests.allTests),
        testCase(Vector4Tests.allTests)
    ]
}
#endif
