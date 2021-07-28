//
//  Menu.swift
//  iDine
//
//  Created by Paul Hudson on 27/06/2019.
//  Copyright © 2019 Hacking with Swift. All rights reserved.
//

import SwiftUI

struct MedicationSection: Codable, Identifiable {
    var id: UUID
    var name: String
    var items: [MedicationItem]
}

struct MedicationItem: Codable, Equatable, Identifiable {
    var id: UUID
    var mainName: String
    var genericName: String
    var description: String
    var instructions: String
    var sideEffects: String
    var dosage: String
    var frequency: Int
    var taken: [String]
    

    //#if DEBUG
    static let example = MedicationItem(
        id: UUID(),
        mainName: "Main Name",
        genericName: "Generic Name",
        description: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you…",
        instructions: "Instructions",
        sideEffects: "Side Effects",
        dosage: "Dosage",
        frequency: 6,
        taken: []
        )
    //#endif
}

struct HistoryItem: Codable, Equatable, Identifiable {
    var id:String {
        return "\(mainName) \(date) \(time)"
    }
    var mainName: String
    var taken: Date
    var time:String  {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: taken)
    }
    
    var date:String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter.string(from: taken)
    }
    
    var fromToday: Bool {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        let today = formatter.string(from: Date())
        let medDay = formatter.string(from: taken)
        return (today == medDay)
    }
    
    static let example = HistoryItem(
        mainName: "Main Name",
        taken: Date()
        )
    
}

extension Date {
    static var todayFormatted:String {
        let formatter=DateFormatter()
        //formatter.dateStyle = .short
        //formatter.timeStyle = .none
        formatter.dateFormat = "MMMM d, yyyy"
        return formatter.string(from: Date())
        
    }
}
