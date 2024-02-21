//
//  WeatherManager.swift
//  Weather App
//
//  Created by Filip Szumotalski on 20/02/2024.
//

import Foundation
import CoreLocation

class WeatherManager {
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string: "https://api.weatherapi.com/v1/forecast.json?key=5beea27c0c8b46b2a84215132241902&q=\(latitude),\(longitude)") else {fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching data from API") }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
        
    }
}

struct ResponseBody: Decodable {
    let location: Location
    let current: CurrentWeather
    let forecast: Forecast
    
    struct Location: Decodable {
        let name: String
    }
    
    struct Condition: Decodable {
        let text: String
        let icon: String
        let code: Int
    }
    
    struct CurrentWeather: Decodable {
        let temp_c: Double
        let feelslike_c: Double
        let condition: Condition
        let wind_kph: Double
        let humidity: Int
    }
    
    struct ForecastDay: Decodable {
        let date: String
        let day: Day
        
        struct Day: Decodable {
            let maxtemp_c: Double
            let mintemp_c: Double
        }
    }
    
    struct Forecast: Decodable {
        let forecastday: [ForecastDay]
    }
}


