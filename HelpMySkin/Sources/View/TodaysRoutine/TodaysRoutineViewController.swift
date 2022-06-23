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
    @IBOutlet weak var weatherCardText: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
  let temperatureService : TemperatureService = TemperatureService()
    public var notifications: [Notification] = Notification.sampleData
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(named: "Primary")
        let cellNib = UINib(nibName: NotificationView.identifier, bundle: .main)
        tableView.register(cellNib, forCellReuseIdentifier: NotificationView.identifier)
        Task {
                let data = await fetchApiData()
                configureCard(temperatureData: data)
        }
//        weatherCardImage.image = obtainWeatherIcon(temperature: -30)
//        lastTimeRequestText.text = obtainLastTimeRequestText(newTime: 61)
//        temperatureText.text = obtainTemperatureText(newValue: -30)
    }
    func obtainWeatherIcon (temperature: Int) -> UIImage {
         if temperature < 10 {
           return UIImage(named: "thunder")!
        } else if temperature >= 10 && temperature < 20 {
            return UIImage(named: "cloudy")!
        }
        return UIImage(named: "sunny")!
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
    func obtainWeatherCardText(temperature: Int) -> String {
      if temperature < 20 {
        return WeatherInfo.coldWeather.weatherCardText
     }
     return WeatherInfo.hotWeather.weatherCardText
    }
    func configureCard(temperatureData : Temperature?) {
        if temperatureData != nil {
            weatherCardImage.image = obtainWeatherIcon(temperature: Int(temperatureData!.temp))
            lastTimeRequestText.text = obtainLastTimeRequestText(newTime: 0)
            temperatureText.text = obtainTemperatureText(newValue: Int(temperatureData!.temp))
            weatherCardText.text = obtainWeatherCardText(temperature: Int(temperatureData!.temp))
        }
    }
    func fetchApiData() async -> Temperature? {
        do {
            return try await temperatureService.currentTemperature()
        } catch {
            print("Error")
        }
        return nil
    }
}

extension TodaysRoutineViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return notifications.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: NotificationView.identifier, for: indexPath) as! NotificationView
//    cell.textLabel?.text = notifications[indexPath.row].title
    cell.titleLabel?.text = notifications[indexPath.row].title
    cell.descriptionLabel?.text = notifications[indexPath.row].description
    cell.backgroundColor = UIColor(named: "Primary")
    let bgColorView = UIView()
    bgColorView.backgroundColor = UIColor(named: "Primary")
    cell.selectedBackgroundView = bgColorView
    return cell
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "NotificationSheet", bundle: nil)
    let sheetPresentationController = storyboard.instantiateViewController(withIdentifier: "SheetViewController")
    self.present(sheetPresentationController, animated: true, completion: nil)
  }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.tableView.beginUpdates()
            self.notifications.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.tableView.endUpdates()
        }
    }
}
