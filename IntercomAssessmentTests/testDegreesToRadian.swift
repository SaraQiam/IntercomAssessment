
import XCTest
@testable import IntercomAssessment

class testDegreesToRadian: XCTestCase {

    var sut: Converter!

    override func setUp() {
        sut = Converter()
    }

    override func tearDown() {
        sut = nil
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

    func test0DegreesIsZeroRadians() {
        let degrees: Double = 0
        let radians = sut.degreesToRadians(degrees)
        XCTAssertEqual(radians, 0, accuracy: 0.0001)
    }

    func test30DegreesIsPieOverSixRadians() {
        let degrees: Double = 30.0
        let radians = sut.degreesToRadians(degrees)
        XCTAssertEqual(radians, 0.5235, accuracy: 0.0001)
    }

    func test180DegreesIsPieRadians() {
        let degrees: Double = 180
        let radians = sut.degreesToRadians(degrees)
        XCTAssertEqual(radians, 3.1415, accuracy: 0.0001)
    }

    func testNegative90DegreesIsNegativePieOverTwoRadians() {
        let degrees: Double = -90
        let radians = sut.degreesToRadians(degrees)
        XCTAssertEqual(radians, -1.5707, accuracy: 0.0001)
    }

    func testDummyDegreesIsNilRadians() {
        let degrees: String = "Dummy"
        let radians = sut.degreesToRadians(degrees)
        XCTAssertEqual(radians, nil)
    }

    func test45DegreesIsPieOverFourRadians() {
        let degrees: String = "45"
        if let radians = sut.degreesToRadians(degrees) {
            XCTAssertEqual(radians, 0.7853, accuracy: 0.0001)
        } else {
            XCTFail()
        }
    }

    func test360DegreesTwoPieRadians() {
        let degrees: String = "360"
        if let radians = sut.degreesToRadians(degrees) {
            XCTAssertEqual(radians, 6.2831, accuracy: 0.0001)
        } else {
            XCTFail()
        }
    }

    func testNegative60DegreesIsNegativePieOverThreeRadians() {
        let degrees: String = "-60"
        if let radians = sut.degreesToRadians(degrees) {
            XCTAssertEqual(radians, -1.0471, accuracy: 0.0001)
        } else {
            XCTFail()
        }
    }
}
