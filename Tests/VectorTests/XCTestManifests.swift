import XCTest

#if !os(macOS) 
    #if canImport(simd)
    public func allTests() -> [XCTestCaseEntry] {
        return [
            testCase(Vector2Tests.allTests),
            testCase(Vector3Tests.allTests),
            testCase(Vector4Tests.allTests)
        ]
    }
    #else 
    public func allTests() -> [XCTestCaseEntry] {
        return []
    }
    #endif
#endif