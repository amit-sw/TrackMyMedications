//
//  ContentView.swift
//  TrackMyMedications
//
//  Created by Amit Gupta on 7/18/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MedicationView()
                .tabItem {
                    Label("Medications", systemImage: "list.dash")
                }
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "square.and.pencil")
                }
            ResetMedicationsView()
                .tabItem {
                    Label("Reset", systemImage: "trash")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
