//
//  WeatherCard.swift
//  HelpMySkin
//
//  Created by Thiago Henrique on 21/06/22.
//

import UIKit

class WeatherCard: UIView {
    static let identifier = "WeatherCard"

    @IBOutlet weak var weatherCardImage: UIImageView!
    @IBOutlet weak var lastTimeRequestText: UILabel!
    @IBOutlet weak var temperatureText: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubViews()
        configureCard()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    func initSubViews() {
        let cardNib = UINib(nibName: WeatherCard.identifier, bundle: nil)
        guard let view = cardNib.instantiate(withOwner: self, options: nil).first as?
                UIView else { fatalError("Unable to convert a nib") }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    func configureCard() {
        weatherCardImage.image = obtainWeatherIcon(temperature: 5)
        lastTimeRequestText.text = obtainLastTimeRequestText(newTime: 23)
        temperatureText.text = obtainTemperatureText(newValue: 5)
    }

}
