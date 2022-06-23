//
//  Notification.swift
//  HelpMySkin
//
//  Created by Lais Godinho on 21/06/22.
//

import Foundation
import StepperView

class Notification: Identifiable, ObservableObject {
  @Published var id: UUID
  @Published var icon: String
  @Published var title: String
  @Published var description: String
  @Published var steps: [TextView]
  init(id: UUID = UUID(), icon: String = "sun", title: String, description: String, steps: [TextView] = []) {
    self.id = id
    self.icon = icon
    self.title = title
    self.description = description
    self.steps = steps
  }
}

extension Notification {
  static var sampleData = [
    Notification(
      icon: CareInfo.dayInfo.icon,
      title: CareInfo.dayInfo.title,
      description: CareInfo.dayInfo.description,
      steps: CareInfo.dayInfo.steps),
    Notification(
      icon: "moisturizer",
      title: "Hidratante",
      description: WeatherInfo.hotWeather.steps[0]),
    Notification(
      icon: "water",
      title: "Limpeza",
      description: WeatherInfo.hotWeather.steps[1]),
    Notification(
      icon: "sunscreen",
      title: "Proteção solar",
      description: WeatherInfo.hotWeather.steps[2]),
    Notification(
      icon: "sunglasses",
      title: "Acessórios",
      description: WeatherInfo.hotWeather.steps[3]),
    Notification(
      icon: CareInfo.nightInfo.icon,
      title: CareInfo.nightInfo.title,
      description: CareInfo.nightInfo.description,
      steps: CareInfo.nightInfo.steps)
  ]
}
