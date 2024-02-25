//
//  weatherView.swift
//  Weather App
//
//  Created by Filip Szumotalski on 21/02/2024.
//

import SwiftUI

struct WeatherView: View {
    
    var weather: ResponseBody
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                VStack(spacing: 2) {
                    Text(weather.location.name)
                        .font(.system(size: 64))
                    
                    let currentDay = weather.forecast.forecastday.first
                    let maxTemp = currentDay?.day.maxtemp_c ?? 0
                    let minTemp = currentDay?.day.mintemp_c ?? 0
                    
                    // Default value of 0 if no data available
                    Text("H:\(maxTemp.roundDouble())°  L: \(minTemp.roundDouble())°")
                        .font(.system(size: 20))
                    
                    Text("\(weather.current.condition.text)")
                        .font(.system(size: 24))
                    
                    Text(weather.current.temp_c.roundDouble() + "°")
                        .font(.system(size: 100))
                }
                .frame(maxWidth: .infinity)
                
                VStack{
                    HStack {
                       
                    }
                }.background(Color .gray)
                
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
                
                    HStack(spacing: 20){
                        
                        WeeklyForecastRow(logo: "cloud", day: "Mon", temp: 6, spacing: 10)
                        //in place of cloud and day instead of string there needs to be data from the api
                        
                        WeeklyForecastRow(logo: "smoke", day: "Tue", temp: 6, spacing: 10)
                        
                        WeeklyForecastRow(logo: "sun.max", day: "Wed", temp: 6, spacing: 8)
                        
                        WeeklyForecastRow(logo: "cloud.sun", day: "Thu", temp: 6, spacing: 10)
                        
                        // Adjust the sizing of the rows so that they're the same for all and they dont depend on the size of the image
                    }
                    
                }
                
                
            }
            .padding()
        }
        .preferredColorScheme(.dark)
    }
    
}


struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)
    }
}
