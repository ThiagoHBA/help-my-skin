//
//  Notification.swift
//  HelpMySkin
//
//  Created by Lais Godinho on 21/06/22.
//

import Foundation

struct Notification: Identifiable {
  var id: UUID
  var icon: String
  var title: String
  var description: String
  init(id: UUID = UUID(), icon: String = "sun", title: String, description: String) {
    self.id = id
    self.icon = icon
    self.title = title
    self.description = description
  }
}

extension Notification {
  static var sampleData = [
    Notification(icon: CareInfo.dayInfo.icon, title: CareInfo.dayInfo.title, description: CareInfo.dayInfo.description),
    Notification(icon: "moisturizer", title: "Hidratante", description: WeatherInfo.hotWeather.steps[0]),
    Notification(icon: "water", title: "Limpeza", description: WeatherInfo.hotWeather.steps[1]),
    Notification(icon: "sunscreen", title: "Proteção solar", description: WeatherInfo.hotWeather.steps[2]),
    Notification(icon: "sunglasses", title: "Acessórios", description: WeatherInfo.hotWeather.steps[3]),
    Notification(icon: CareInfo.nightInfo.icon, title: CareInfo.nightInfo.title, description: CareInfo.nightInfo.description)
    
  ]
}
