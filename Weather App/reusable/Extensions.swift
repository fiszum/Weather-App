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
