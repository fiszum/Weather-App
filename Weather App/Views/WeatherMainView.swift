//
//  weatherView.swift
//  Weather App
//
//  Created by Filip Szumotalski on 21/02/2024.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    @ObservedObject var locationManager: LocationManager
    
    init(weather: ResponseBody, locationManager: LocationManager) {
        self.weather = weather
        self.locationManager = locationManager
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Spacer()
                VStack(spacing: 2) {
                    Text("\(locationManager.userLocation )")
                        .font(.system(size: 64))
                    
                    let currentDay = weather.daily.first
                    let maxTemp = currentDay?.temp.max.kelvinToCelsius() ?? 0
                    let minTemp = currentDay?.temp.min.kelvinToCelsius() ?? 0
                    let celsiusTemperature = weather.current.temp.kelvinToCelsius()
                    
                    // Default value of 0 if no data available
                    Text("H:\(maxTemp.roundDouble())°  L: \(minTemp.roundDouble())°")
                        .font(.system(size: 20))
                    
                    Text(weather.current.weather.first?.main ?? "no data")
                        .font(.system(size: 24))
                    
                    Text(celsiusTemperature.roundDouble() + "°")
                        .font(.system(size: 100))
                }
                .frame(maxWidth: .infinity)
                
                VStack {
                    let hourlyWeather = Array(weather.hourly.prefix(4))

                    HStack(spacing: 20 ) {
                    
                        ForEach(hourlyWeather, id: \.dt) { forecastHour in
                            WeeklyForecastRow(logo: forecastHour.weather[0].main, day: forecastHour.dt.formattedHour(), temp: forecastHour.temp.kelvinToCelsius(), spacing: 10)
                                .frame(maxWidth: .infinity) // Set the frame to take up the whole width
                        }
                    }
                    .padding(0.5) // Add padding to space the elements evenly
                }
                .background(Color.gray)
                .clipShape(RoundedRectangle(cornerRadius: 35))

                
                VStack(alignment: .leading) {
                    Spacer()
                    Button(action: {
                        // screen change
                    }) {
                        HStack {
                            Text("Weekly weather")
                                .font(.system(size: 26))
                            Image(systemName: "arrow.right")
                                .font(.system(size: 26))
                        }
                        .foregroundColor(.white)
                    }
                    
                    // Pre-process the second to fourth forecast days
                    let forecastDays = Array(weather.daily.dropFirst().prefix(4))

                    // Construct the view
                    HStack(spacing: 10) {
                        ForEach(forecastDays, id: \.dt) { forecastDay in
                            let date = Date(timeIntervalSince1970: forecastDay.dt)
                            WeeklyForecastRow(logo: forecastDay.weather[0].main, day: date.formattedDate(), temp: forecastDay.temp.max.kelvinToCelsius(), spacing: 20).fixedSize()
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            locationManager.requestLocation() // Request user's location when the view appears
        }
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        let locationManager = LocationManager()
        locationManager.userLocation = "London"
        return WeatherView(weather: previewWeather, locationManager: locationManager)
    }
}
