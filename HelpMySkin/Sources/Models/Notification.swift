//
//  Notification.swift
//  HelpMySkin
//
//  Created by Lais Godinho on 21/06/22.
//

import Foundation

struct Notification: Identifiable {
  var id: UUID
  var title: String
  var description: String
  init(id: UUID = UUID(), title: String, description: String) {
    self.id = id
    self.title = title
    self.description = description
  }
}

extension Notification {
  static var sampleData = [
    Notification(title: "Bom dia!", description: "Comece seus cuidados de hoje"),
    Notification(title: "Boa noite!", description: "Não esqueça dos cuidados da noite!")
    
  ]
}
