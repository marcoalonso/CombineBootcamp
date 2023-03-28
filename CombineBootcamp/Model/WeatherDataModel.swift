//
//  WeatherDataModel.swift
//  CombineBootcamp
//
//  Created by Marco Alonso Rodriguez on 28/03/23.
//

import Foundation

struct WeatherDataModel: Decodable {
    let name: String
    let weather: [Weather]
    let main: Main
    
}

struct Main : Decodable {
    let temp: Double?
    let humidity: Int? 
    
    static var placeholder: Main {
        return Main(temp: nil, humidity: nil)
    }
}

struct Weather: Decodable {
    let description: String
    let icon: String
    let id: Int
}
