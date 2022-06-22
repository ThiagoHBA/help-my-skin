//
//  SheetViewController.swift
//  HelpMySkin
//
//  Created by Lais Godinho on 22/06/22.
//

import UIKit

class SheetViewController: UIViewController, UISheetPresentationControllerDelegate {
  override var sheetPresentationController: UISheetPresentationController {
    // swiftlint:disable force_cast
    presentationController as! UISheetPresentationController
    // swiftlint:enable force_cast
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    sheetPresentationController.delegate = self
    sheetPresentationController.selectedDetentIdentifier = .large
    sheetPresentationController.prefersGrabberVisible = true
    sheetPresentationController.detents = [
      .medium(),
      .large()
    ]
  }
}
