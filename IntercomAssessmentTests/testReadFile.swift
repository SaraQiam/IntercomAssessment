
import XCTest
@testable import IntercomAssessment

class testReadFile: XCTestCase {

    var sut: ReadFile!

    override func setUp() {
        sut = ReadFile()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        sut = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testFileIsEmpty() {
        if let lines = sut.lineByLineAsString("Empty", "txt") {
            XCTAssertEqual(lines.count, 0)
        } else {
            XCTFail()
        }
    }

    func testFileDoesNotExist() {
        let lines = sut.lineByLineAsString("abc123", "txt")
        XCTAssertEqual(lines, nil)
    }

    func testFileIs10Lines() {
        if let lines = sut.lineByLineAsString("Test", "txt") {
            XCTAssertEqual(lines.count, 10)
        } else {
            XCTFail()
        }
    }

    func testFileis32Lines() {
        if let lines = sut.lineByLineAsString("customers", "txt") {
            XCTAssertEqual(lines.count, 32)
        } else {
            XCTFail()
        }
    }
}
