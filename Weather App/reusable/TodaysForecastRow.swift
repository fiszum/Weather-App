//
//  todaysForecastRow.swift
//  Weather App
//
//  Created by Filip Szumotalski on 25/02/2024.
//

import SwiftUI

struct TodaysForecastRow: View {
    var logo: String
    var hour: String
    var temp: Double
    var spacing: Double
    
    var body: some View {
        VStack(spacing: spacing) {
            Text(hour)
                .font(.system(size: 20))
                .bold()
            
            Image(systemName: logo)
                .font(.system(size: 25))
            
            Text("\(temp.roundDouble())°")
                .font(.system(size: 20))
        }
        .padding(8)
    }
}



struct TodaysForecastRow_Previews: PreviewProvider {
    static var previews: some View {
        TodaysForecastRow(logo: "sun.max", hour: "11", temp: 8, spacing: 8)
    }
}
