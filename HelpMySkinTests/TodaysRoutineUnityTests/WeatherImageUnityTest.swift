//
//  TodaysRoutineUnityTest.swift
//  HelpMySkinTests
//
//  Created by Thiago Henrique on 09/06/22.
//

import XCTest
@testable import HelpMySkin

class WeatherImageUnityTest: XCTestCase {
    var controller : TodaysRoutineViewController!

    override func setUpWithError() throws {
        controller = TodaysRoutineViewController()
    }

    override func tearDownWithError() throws {}
    
    func test_obtainWeatherImage_shouldBe_Cloud() {
        //given
        let temperature = -25.0
        
        //when
        let imageResult = controller.obtainWeatherIcon(temperature: temperature)
        
        //then
        XCTAssertEqual(imageResult, UIImage(systemName: "cloud.fill"))
    }
    
    func test_obtainWeatherImage_shouldBe_Sunrise() {
        //given
        let temperature = 50.0
        
        //when
        let imageResult = controller.obtainWeatherIcon(temperature: temperature)
        
        //then
        XCTAssertEqual(imageResult, UIImage(systemName: "sunrise.fill"))
    }

}
