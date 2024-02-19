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
        guard let url = URL(string: "http://api.weatherapi.com/v1/current.json?key=5beea27c0c8b46b2a84215132241902&q=\(latitude),\(longitude)") else {fatalError("Missing URL")}
        
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
    
    struct Location: Decodable {
        let name: String
        let localtime: String
    }
    
    struct Condition: Decodable {
        let text: String
        let icon: String
        let code: Int
    }
    
    struct CurrentWeather: Decodable {
        let temp_c: Double
        let is_day: Int //returns 1 or 0 depending if its a day --  can be used to manipulate dark mode light mode
        let condition: Condition
        let wind_kph: Double
        let wind_dir: String
        let pressure_mb: Double
        let precip_mm: Double
        let humidity: Int
        let feelslike_c: Double
      
    }
    
    struct ResponseBody: Decodable {
        let location: Location
        let current: CurrentWeather
    }
}
