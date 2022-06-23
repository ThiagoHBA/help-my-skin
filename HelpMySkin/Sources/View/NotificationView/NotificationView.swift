//
//  NotificationView.swift
//  HelpMySkin
//
//  Created by Lais Godinho on 09/06/22.
//

import UIKit

class NotificationView: UITableViewCell {
  static let identifier = "NotificationView"
  @IBOutlet var icon: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet var descriptionLabel: UILabel!
  @IBOutlet weak var iconImage: UIImageView!
  override func awakeFromNib() {
    super.awakeFromNib()

  }
}
