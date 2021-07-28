//
//  History.swift
//  TrackMyMedications
//
//  Created by Amit Gupta on 7/18/21.
//

import Foundation

class History: ObservableObject {
    @Published var medications = [MedicationItem]()
    @Published var historyList = [HistoryItem]()
    func add(item: MedicationItem) {
        medications.append(item)
        historyList.append(HistoryItem(mainName: item.mainName, taken: Date()))
    }
    
    func remove(item: MedicationItem) {
        if let index = medications.firstIndex(of: item) {
            medications.remove(at: index)
        }
        if let i = historyList.firstIndex(where: {$0.mainName==item.mainName}) {
            medications.remove(at: i)
        }
    }
    
    static let example = History()
    
}
