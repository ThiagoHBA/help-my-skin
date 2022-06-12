//
//  NotificationView.swift
//  HelpMySkin
//
//  Created by Lais Godinho on 09/06/22.
//

import UIKit

class NotificationView: UIView {
  static let identifier = "NotificationView"
  @IBOutlet var mainView: UIView!
  @IBOutlet var icon: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet var descriptionLabel: UILabel!
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    initSubviews()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    initSubviews()
  }

  func initSubviews() {
    let notificationNib = UINib(nibName: NotificationView.identifier, bundle: nil)
    guard let view = notificationNib.instantiate(withOwner: self, options: nil).first as?
            UIView else { fatalError("Unable to convert nib") }

    view.frame = bounds
    view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    view.layer.cornerRadius = 6
    view.layer.shadowOpacity = 1
    view.layer.shadowOffset = CGSize(width: 0, height: 3)
    view.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.25)
    addSubview(view)
  }

  func setSubcomponents(title: String, description: String, image: UIImage) {
    titleLabel.text = title
    descriptionLabel.text = description
    icon.image = image
  }
}
