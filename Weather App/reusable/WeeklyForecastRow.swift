//
//  todaysForecastRow.swift
//  Weather App
//
//  Created by Filip Szumotalski on 21/02/2024.
//

import SwiftUI

struct WeeklyForecastRow: View {
    var logo: String
    var day: String
    var temp: Double
    var spacing: Double
    
    var body: some View {
        VStack(spacing: spacing) {
            Text (day)
                .font(.system(size: 25))
            
            Image(systemName: logo)
                .font(.system(size: 30))
            
            Text("\(temp.roundDouble())°")
                    .font(.system(size: 25))
            
        }
        .padding()
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.gray/*@END_MENU_TOKEN@*/)
        .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
        .clipShape(RoundedRectangle(cornerRadius: 90, style: .continuous))
        .fixedSize()
        
        }
       
    }

struct TodaysForecastRow_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyForecastRow(logo: "sun.max", day: "Mon", temp: 8, spacing: 8)
    }
}
