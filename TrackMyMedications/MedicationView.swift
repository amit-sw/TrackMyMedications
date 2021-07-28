//
//  MedicationView.swift
//  TrackMyMedications
//
//  Created by Amit Gupta on 7/18/21.
//

import SwiftUI

struct MedicationView: View {
    let medications = Bundle.main.decode([MedicationSection].self, from:"menu.json")
    var body: some View {
        NavigationView {
            List {
                Text("Rohana Talagala")
                    .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                Text(Date.todayFormatted)
                    .font(.headline)
                ForEach(medications) {section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { item in
                            NavigationLink(destination: MedicationDetail(item: item)) {
                                    MedicationRow(item: item)
                        }
                    }
                    
                }
            }
        }
    }
}
}

struct MedicationView_Previews: PreviewProvider {
    static var previews: some View {
        MedicationView()
    }
}
