
import XCTest
@testable import IntercomAssessment

class testCalculateDistance: XCTestCase {

    var sut : CalculateDistance!

    override func setUp() {
        sut = CalculateDistance()
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

    func testDistanceFromIntercomIsNil() {
        let latitude: String = "latitude"
        let longitude: String = "longitude"
        let distance = sut.fromIntercomDublin(latitude, longitude)
        XCTAssertEqual(distance, nil)
    }

    func testDistanceFromIntercomIs10km() {
        let latitude: String = "53.2451022"
        let longitude: String = "-6.238335"
        if let distance = sut.fromIntercomDublin(latitude, longitude) {
            XCTAssertEqual(distance, 10.5788, accuracy: 0.0001)
        } else {
            XCTFail()
        }
    }

    func testDistanceFromIntercomIs324km() {
        let latitude: String = "51.8856167"
        let longitude: String = "-10.4240951"
        if let distance = sut.fromIntercomDublin(latitude, longitude) {
            XCTAssertEqual(distance, 324.7382, accuracy: 0.0001)
        } else {
            XCTFail()
        }
    }

    func testDistanceFromIntercomIs82km() {
        let latitude: String = "53.761389"
        let longitude: String = "-7.2875"
        if let distance = sut.fromIntercomDublin(latitude, longitude) {
            XCTAssertEqual(distance, 82.7354, accuracy: 0.0001)
        } else {
            XCTFail()
        }
    }



}
