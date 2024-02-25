//
//  todaysForecastRow.swift
//  Weather App
//
//  Created by Filip Szumotalski on 21/02/2024.
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
                .font(.system(size: 30))
                .bold()
            
            Image(systemName: logo)
                .font(.system(size: 35))
            
            Text("\(temp.roundDouble())°")
                    .font(.system(size: 30))
            
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
        TodaysForecastRow(logo: "sun.max", hour: "11", temp: 8, spacing: 8)
    }
}
