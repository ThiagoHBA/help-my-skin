//
//  ViewController.swift
//  HelpMySkin
//
//  Created by Thiago Henrique on 07/06/22.
//

import UIKit

class TodaysRoutineViewController: UIViewController {

    @IBOutlet weak var weatherCardImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weatherCardImage.image = changeWeatherIcon(temperature: 10)
    }
    func changeWeatherIcon (temperature: Double) -> UIImage {
         if temperature < 10 {
            return UIImage(systemName: "cloud.fill")!
        } else if temperature >= 10 && temperature < 20 {
            return UIImage(systemName: "cloud.sun.fill")!
        }
        return UIImage(systemName: "sunrise.fill")!
    }
}
