import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(Vector2Tests.allTests),
        testCase(Vector3Tests.allTests),
        testCase(Vector4Tests.allTests)
    ]
}
#endif
