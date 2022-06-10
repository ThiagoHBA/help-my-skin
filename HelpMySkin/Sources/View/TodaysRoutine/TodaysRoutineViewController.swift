//
//  ViewController.swift
//  HelpMySkin
//
//  Created by Thiago Henrique on 07/06/22.
//

import UIKit

class TodaysRoutineViewController: UIViewController {

    @IBOutlet weak var weatherCardImage: UIImageView!
    @IBOutlet weak var lastTimeRequestText: UILabel!
    @IBOutlet weak var temperatureText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        weatherCardImage.image = obtainWeatherIcon(temperature: 10)
        lastTimeRequestText.text = obtainLastTimeRequestText(newTime: 61)
        temperatureText.text = obtainTemperatureText(newValue: -30)
    }
    func obtainWeatherIcon (temperature: Double) -> UIImage {
         if temperature < 10 {
            return UIImage(systemName: "cloud.fill")!
        } else if temperature >= 10 && temperature < 20 {
            return UIImage(systemName: "cloud.sun.fill")!
        }
        return UIImage(systemName: "sunrise.fill")!
    }
    func obtainLastTimeRequestText(newTime: Int) -> String {
        if newTime <= 0 {
            return "Agora mesmo"
        }
        if newTime > 60 {
            return "Há mais de uma hora atrás"
        }
        return "\(newTime) minuto\(newTime>1 ? "s": "") atrás"
    }
    func obtainTemperatureText(newValue: Int) -> String {
        let unity = "˚C"
        if newValue > 99 {
            return "99\(unity)"
        }
        if newValue < -99 {
            return "-99\(unity)"
        }
        return "\(newValue)\(unity)"
    }
}
