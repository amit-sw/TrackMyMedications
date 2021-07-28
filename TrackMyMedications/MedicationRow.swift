//
//  ItemRow.swift
//  TrackMyMedications
//
//  Created by Amit Gupta on 7/18/21.
//

import SwiftUI

struct MedicationRow: View {
    let item: MedicationItem
    @EnvironmentObject var history: History
    var body: some View {
        HStack {
        Text(item.mainName)
            Spacer()
            Text("Taken \(alreadyTaken()) of \(item.frequency) /day")
                .multilineTextAlignment(.trailing)
                
        }
    }
    
    func alreadyTaken() -> Int {
        //return history.medications.filter({item.mainName==$0.mainName}).count
        return history.historyList.filter({item.mainName==$0.mainName && $0.fromToday}).count
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        MedicationRow(item: MedicationItem.example)
    }
}
