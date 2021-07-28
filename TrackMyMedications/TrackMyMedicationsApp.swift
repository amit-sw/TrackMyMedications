//
//  TrackMyMedicationsApp.swift
//  TrackMyMedications
//
//  Created by Amit Gupta on 7/18/21.
//

import SwiftUI

@main
struct TrackMyMedicationsApp: App {
    @StateObject var history=History()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(history)
        }
    }
}
