//
//  WeatherModel.swift
//  Weather
//
//  Created by Derlis Ramón Cañete Ríos on 2023-04-14.
//

import Foundation

struct WeatherModel {
    let city: String
    let weather: String
    let description: String
    let iconURL: URL?
    let currentTemperature: String
    let minTemperature: String
    let maxTemperature: String
    let humidity: String
    
    static let empty: WeatherModel = .init(city: "No city",
                                           weather: "No weather",
                                           description: "No description",
                                           iconURL: nil,
                                           currentTemperature: "0º",
                                           minTemperature: "0º Min.",
                                           maxTemperature: "0º Máx.",
                                           humidity: "0%")
}
