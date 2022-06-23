//
//  TemperatureServiceProtocol.swift
//  HelpMySkin
//
//  Created by Thiago Henrique on 21/06/22.
//

import Foundation

protocol TemperatureServiceProtocol {
    func currentTemperature() async throws -> Temperature?
}
