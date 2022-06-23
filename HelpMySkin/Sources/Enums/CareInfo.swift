//
//  CareInfo.swift
//  HelpMySkin
//
//  Created by Lais Godinho on 23/06/22.
//

import Foundation
import StepperView

enum CareInfo {
  case dayInfo
  case nightInfo

  var icon: String {
    switch self {
    case .dayInfo:
      return "sun"
    case .nightInfo:
      return "moon"
    }
  }

  var title: String {
    switch self {
    case .dayInfo:
      return "Bom dia!"
    case .nightInfo:
      return "Boa noite!"
    }
  }

  var description: String {
    switch self {
    case .dayInfo:
      return "Comece seus cuidados de hoje"
    case .nightInfo:
      return "Não esqueça os cuidados da noite"
    }
}
  
  var steps: [TextView] {
    switch self {
    case .dayInfo:
      return [
        TextView(text: "Limpeza", font: .system(size: 14, weight: .semibold)),
        TextView(text: "Hidratação", font: .system(size: 14, weight: .semibold)),
        TextView(text: "Proteção solar", font: .system(size: 14, weight: .semibold))]
    case .nightInfo:
      return [
        TextView(text: "Limpeza", font: .system(size: 14, weight: .semibold)),
        TextView(text: "Hidratação", font: .system(size: 14, weight: .semibold))]
    }
  }
}
