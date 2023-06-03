//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Izu Eneh on 2023-06-01.
//

import SwiftUI

struct NewScrumSheet: View {
    @State private var newScrumInitialized = DailyScrum.emptyScrum
    @Binding var scrums: [DailyScrum]
    @Binding var isPresentingNewScrumView: Bool
    
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $newScrumInitialized)
                .toolbar() {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewScrumView = false
                        }
                    }
                    
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            scrums.append(newScrumInitialized)
                            isPresentingNewScrumView = false
                        }
                    }
                }
        }
    }
}

struct NewScrumSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewScrumSheet(scrums: .constant(DailyScrum.sampleData), isPresentingNewScrumView: .constant(true))
    }
}
