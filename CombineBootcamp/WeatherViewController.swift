//
//  WeatherViewController.swift
//  CombineBootcamp
//
//  Created by Marco Alonso Rodriguez on 28/03/23.
//

import UIKit
import Combine

class WeatherViewController: UIViewController {
    
    private var webservice: Webservice = Webservice()
    private var cancellable: AnyCancellable?
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        self.cancellable = self.webservice.fetchWeather(city: "Morelia")
            .catch { _ in
                Just(Main.placeholder )
            }
            .map { weather in
                if let temp = weather.temp {
                    return "\(temp) °C"
                } else {
                    return "Error getting weather"
                }
            }.assign(to: \.text, on: self.temperatureLabel)
    }
    


}
