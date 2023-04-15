//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Derlis Ramón Cañete Ríos on 2023-04-13.
//

import Foundation

final class WeatherViewModel: ObservableObject {
    
    @Published var weatherModel: WeatherModel = .empty
    private let weatherModelMapper = WeatherModelMapper()
    
    func getWeather(city: String) async {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=135935d4fd0889e153b14b90b2e8e0b3&units=metric&lang=es)")!
        
        do {
            async let (data, _) = try await URLSession.shared.data(from: url)
            let dataModel = try await JSONDecoder().decode(WeatherResponseDataModel.self, from: data)
            
            DispatchQueue.main.async {
                self.weatherModel = self.weatherModelMapper.mapDataModelToModel(dataModel: dataModel)
            }
            
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
