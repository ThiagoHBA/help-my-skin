//
//  SheetViewController.swift
//  HelpMySkin
//
//  Created by Lais Godinho on 22/06/22.
//

import UIKit
import SwiftUI

class SheetViewController: UIViewController, UISheetPresentationControllerDelegate {
  var notification: Notification = Notification.sampleData[0]
  
  override var sheetPresentationController: UISheetPresentationController {
    // swiftlint:disable force_cast
    presentationController as! UISheetPresentationController
    // swiftlint:enable force_cast
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    let swiftUIController = UIHostingController(rootView: NotificationSheetContentView().environmentObject(notification))
    addChild(swiftUIController)
    view.addSubview(swiftUIController.view)
    setupConstraints(swiftUIController: swiftUIController)
    sheetPresentationController.delegate = self
    sheetPresentationController.selectedDetentIdentifier = .large
    sheetPresentationController.prefersGrabberVisible = true
    sheetPresentationController.detents = [
      .medium(),
      .large()
    ]
  }
  fileprivate func setupConstraints(swiftUIController: UIViewController) {
      swiftUIController.view.translatesAutoresizingMaskIntoConstraints = false
      swiftUIController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
      swiftUIController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
      swiftUIController.view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
      swiftUIController.view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
      swiftUIController.view.clipsToBounds = true
  }
}
