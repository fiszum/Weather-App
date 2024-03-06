import Foundation
import CoreLocation

class WeatherManager {
    let apiKey = "24388925ee460f3e9351095efde842a0"

    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude)&exclude=minutely,alerts&appid=\(apiKey)") else {
            fatalError("Missing URL")
        }

        let urlRequest = URLRequest(url: url)

        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching data from API")
        }

        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)

        return decodedData
    }
}

struct ResponseBody: Decodable {
    let timezone: String
    let current: CurrentWeather
    let hourly: [HourlyForecast]
    let daily: [DailyForecast]

    struct CurrentWeather: Decodable {
        let temp: Double
        let feels_like: Double
        let weather: [WeatherInfo]
        let wind_speed: Double
        let humidity: Int
    }

    struct HourlyForecast: Decodable {
        let dt: TimeInterval
        let temp: Double
        let weather: [WeatherInfo]
    }
    
    struct WeatherInfo: Decodable {
        let main: String
        let icon: String
    }

    struct DailyForecast: Decodable {
        let dt: TimeInterval
        let temp: Temperature
        let weather: [WeatherInfo]
    }

    struct Temperature: Decodable {
        let min: Double
        let max: Double
    }
}
