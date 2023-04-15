//
//  WeatherModelMapper.swift
//  Weather
//
//  Created by Derlis Ramón Cañete Ríos on 2023-04-14.
//

import Foundation

struct WeatherModelMapper {
    func mapDataModelToModel(dataModel: WeatherResponseDataModel) -> WeatherModel {
        guard let weather = dataModel.weather.first else {
            return .empty
        }
        
        let temperature = dataModel.main
        
        return WeatherModel(city: dataModel.name,
                            weather: weather.main,
                            description: "(\(weather.description))",
                            iconURL: URL(string: "https://openweathermap.org/img/wn/\(weather.icon)@2x.png"),
                            currentTemperature: "\(Int(temperature.temp))º",
                            minTemperature: "\(Int(temperature.tempMin))º Min.",
                            maxTemperature: "\(Int(temperature.tempMax))º Máx.",
                            humidity: "\(temperature.humidity)%")
    }
}
