//
//  WeatherWebservice.swift
//  CombineBootcamp
//
//  Created by Marco Alonso Rodriguez on 28/03/23.
//

import Foundation
import Combine

class WeatherWebservice {
    
    func fetchWeather(city: String) -> AnyPublisher<Main, Error> {
        
        guard let url = URL(string: Constants.URLs.weather) else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: WeatherDataModel.self, decoder: JSONDecoder())
            .map { $0.main }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
