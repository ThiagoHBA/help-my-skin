//
//  TemperatureService.swift
//  HelpMySkin
//
//  Created by Thiago Henrique on 21/06/22.
//

import Foundation

class TemperatureService : TemperatureServiceProtocol {
    func currentTemperature() async throws -> Temperature? {
        do {
            let (data, _) = try await URLSession.shared.data(
                from: URL(
                    string: "https://api.openweathermap.org/data/2.5/weather?lat=3.743430&lon=-38.536370&appid=251bed1fec3f86f382cf8f7689071275&units=metric"
                )!
            )
            let result = try JSONDecoder().decode(WeatherResult.self, from: data)
            return result.main
        } catch {
            print(error)
        }
        return nil
    }
}
