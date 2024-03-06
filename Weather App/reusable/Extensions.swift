//
//  Extensions.swift
//  Weather App
//
//  Created by Filip Szumotalski on 21/02/2024.
//

import Foundation

// Extension for rounded Double to 0 decimals
extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}

extension String {
    // Function to convert localtime to formatted date string
    func formattedStringDate() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" // Assuming localtime format is "yyyy-MM-dd HH:mm"
        
        if let date = dateFormatter.date(from: self) {
            // Customize the date format to show only the part you want
            dateFormatter.dateFormat = "MMM d, yyyy" // Example format: Feb 21, 2024
            return dateFormatter.string(from: date)
        } else {
            return nil // Return nil if unable to convert
        }
    }
}

extension TimeInterval {
    func formattedHour() -> String {
        let date = Date(timeIntervalSince1970: self)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm" // Example format: 9:00 AM
        return dateFormatter.string(from: date)
    }
}

extension Date {
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM"
        return dateFormatter.string(from: self)
    }
}

extension Double {
    func kelvinToCelsius() -> Double {
        return self - 273.15
    }
}

extension String {
    func mapToWeatherIcon() -> String {
        switch self.lowercased() {
        case let description where description.contains("clear"):
            return "sun.max.fill"
        case let description where description.contains("cloud"):
            return "cloud.fill"
        case let description where description.contains("rain") || description.contains("drizzle"):
            return "cloud.rain.fill"
        case let description where description.contains("snow"):
            return "cloud.snow.fill"
        case let description where description.contains("thunder"):
            return "cloud.bolt.fill"
        case let description where description.contains("fog") || description.contains("mist"):
            return "cloud.fog.fill"
        case let description where description.contains("smoke") || description.contains("haze"):
            return "smoke.fill"
        case let description where description.contains("sand") || description.contains("dust") || description.contains("whirls"):
            return "tornado.fill"
        default:
            return "questionmark.circle.fill" // Default icon
        }
    }
}


