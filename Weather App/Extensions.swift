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
