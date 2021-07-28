//
//  SwiftUIView.swift
//  TrackMyMedications
//
//  Created by Amit Gupta on 7/18/21.
//

import SwiftUI

struct ResetMedicationsView: View {
    @EnvironmentObject var history : History
    var body: some View {
        VStack {
            Button("Delete All") {
                history.medications.removeAll(keepingCapacity: true)
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ResetMedicationsView()
    }
}
