//
//  TodaysRoutineUnityTest.swift
//  HelpMySkinTests
//
//  Created by Thiago Henrique on 09/06/22.
//

import XCTest
@testable import HelpMySkin

class TodaysRoutineUnityTest: XCTestCase {
    var controller : TodaysRoutineViewController!

    override func setUpWithError() throws {
        controller = TodaysRoutineViewController()
    }

    override func tearDownWithError() throws {}
    
    func test_changeWeatherImage_shouldBeCloud() {
        //given
        let temperature = -25.0
        
        //when
        let imageResult = controller.changeWeatherIcon(temperature: temperature)
        
        //then
        XCTAssertEqual(imageResult, UIImage(systemName: "cloud.fill"))
    }
    
    func test_changeWeatherImage_shouldBeSunrise() {
        //given
        let temperature = 50.0
        
        //when
        let imageResult = controller.changeWeatherIcon(temperature: temperature)
        
        //then
        XCTAssertEqual(imageResult, UIImage(systemName: "sunrise.fill"))
    }

}
