//
//  HistoryView.swift
//  TrackMyMedications
//
//  Created by Amit Gupta on 7/18/21.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var history: History
    var body: some View {
        NavigationView {
            List {
                Text("Rohana Talagala")
                    .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                    .multilineTextAlignment(.center)
                Text(Date.todayFormatted)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                Text("Medications taken so far")
                    .font(.headline)
                /*
                Section {
                    ForEach(history.medications) { medication in
                        HStack {
                            Text(medication.mainName)
                            Spacer()
                            Text(medication.dosage)
                        }
                    }
                    .onDelete(perform: deleteItems)
                    
                }
 */
                Section {
                    ForEach(history.historyList.filter({$0.fromToday})) { item in
                        HStack {
                            Text(item.mainName)
                            Spacer()
                            Text(item.time)
                        }
                    }
                    .onDelete(perform: deleteItems)
                    
                }
                /*
                Section {
                    NavigationLink( destination: Text("Future work"))
                        {
                            Text("More future work")
                        }
                }
                .disabled(history.medications.isEmpty)
 */
            }
        }

    }
    
    func deleteItems(at offsets: IndexSet) {
        history.medications.remove(atOffsets: offsets)
        history.historyList.remove(atOffsets: offsets)
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
