//
//  lastTimeRequestTextUnityTest.swift
//  HelpMySkinTests
//
//  Created by Thiago Henrique on 10/06/22.
//

import XCTest
@testable import HelpMySkin

class lastTimeRequestTextUnityTest: XCTestCase {
    var controller : WeatherCard!

    override func setUpWithError() throws {
        controller = WeatherCard()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_obtainLasTimeRequest_shouldBe_RightNow() {
        //given
        let testInt = 0
        //then
        let stringValue = controller.obtainLastTimeRequestText(newTime: testInt)
        //when
        XCTAssertEqual(stringValue, "Agora mesmo")
    }
    
    func test_obtainLasTimeRequest_shouldBe_Singular() {
        //given
        let testInt = 1
        //then
        let stringValue = controller.obtainLastTimeRequestText(newTime: testInt)
        //when
        XCTAssertEqual(stringValue, "1 minuto atrás")
    }
    
    func test_obtainLasTimeRequest_shouldBe_Plural() {
        //given
        let testInt = 10
        //then
        let stringValue = controller.obtainLastTimeRequestText(newTime: testInt)
        //when
        XCTAssertEqual(stringValue, "10 minutos atrás")
    }
    
    func test_obtainLasTimeRequest_shouldBe_MoreThanHour() {
        //given
        let testInt = 61
        //then
        let stringValue = controller.obtainLastTimeRequestText(newTime: testInt)
        //when
        XCTAssertEqual(stringValue, "Há mais de uma hora atrás")
    }

}
