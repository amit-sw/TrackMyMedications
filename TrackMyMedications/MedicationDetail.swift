//
//  MedicationDetail.swift
//  TrackMyMedications
//
//  Created by Amit Gupta on 7/18/21.
//

import SwiftUI

struct MedicationDetail: View {
    let item: MedicationItem
    @EnvironmentObject var history: History
    @Environment(\.presentationMode) private var presentationMode
    var body: some View {
        VStack {
            Text("Rohana Talagala")
                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
            Text(Date.todayFormatted)
                .font(.headline)
            Spacer()
            Text(item.mainName)
                .font(.title)
            //Text(item.genericName)
            //Text(item.description)
            Text("Dosage: \(item.dosage)")
            Text("Frequency: \(item.frequency) per day")
            Text("Already taken: \(alreadyTaken())")
            //Text(item.instructions)
            Spacer()
            Button("I just took \(item.mainName)") {
                history.add(item: item)
                self.presentationMode.wrappedValue.dismiss()
            }
            .font(.headline)
            Spacer()
        }
    }
    
    func alreadyTaken() -> Int {
        //return history.medications.filter({item.mainName==$0.mainName}).count
        return history.historyList.filter({item.mainName==$0.mainName && $0.fromToday}).count
    }
}

struct MedicationDetail_Previews: PreviewProvider {
    static var previews: some View {
        MedicationDetail(item: MedicationItem.example)
    }
}
