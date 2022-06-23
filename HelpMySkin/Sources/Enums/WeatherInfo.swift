//
//  WeatherInfo.swift
//  HelpMySkin
//
//  Created by Lais Godinho on 23/06/22.
//

import Foundation
import UIKit

enum WeatherInfo {
  case hotWeather
  case coldWeather

  var weatherCardText: String {
    switch self {
    case .hotWeather:
      return "Durante os dias quentes, há uma maior exposição ao sol e o nosso corpo produz mais suor, em busca da regularização da temperatura corporal."
    case .coldWeather:
      return "As células da pele literalmente encolhem no frio e prejudicam uma proteína chamada filagrina, que ajuda na hidratação natural."
    }
  }
  
  var steps: [String] {
    switch self {
    case .hotWeather:
      return [
        "Trocar hidratantes faciais em creme por séruns ou loções hidratantes mais fluídas (para evitar oleosidade e espinhas). ",
        "Lavar o rosto",
        "Utilizar protetor solar.",
        "Usar acessórios como chapéus, óculos ou sombrinhas."
      ]
    case .coldWeather:
      return [
        "Passar hidratante labial",
        "Refoçar o hidratante facial (preferência por hidratantes em creme)",
        "Mesmo que não esteja fazendo sol, use protetor solar!"
      ]
    }
  }
}
