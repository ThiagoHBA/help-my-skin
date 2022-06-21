//
//  temperatureTextUnityTest.swift
//  HelpMySkinTests
//
//  Created by Thiago Henrique on 10/06/22.
//

import XCTest
@testable import HelpMySkin

class TemperatureTextUnityTest: XCTestCase {
    var controller : TodaysRoutineViewController!

    override func setUpWithError() throws {
        controller = TodaysRoutineViewController()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_obtainTemperature_shouldBe_limited() {
        //given
        let testTemperature = 105
        //when
        let temperatureValue = controller.obtainTemperatureText(newValue: testTemperature)
        //then
        XCTAssertEqual(temperatureValue, "99˚C")
    }
    
    

}
