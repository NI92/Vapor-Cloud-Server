//
//  TimeController.swift
//  App
//
//  Created by TSL017 on 2018-08-31.
//

import Vapor

final class TimeController {
    func currentDate(_ req: Request) throws -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy" // Example: "yyyy-MM-dd HH:mm:ss"
        // Conversions
        let stringDate = formatter.string(from: Date())
        let date = formatter.date(from: stringDate)
        return formatter.string(from: date!)
    }
    
    func currentTime(_ req: Request) throws -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        // Conversions
        let stringDate = formatter.string(from: Date())
        let date = formatter.date(from: stringDate)
        return formatter.string(from: date!)
    }
}
