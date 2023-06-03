//
//  EditScrumSheet.swift
//  Scrumdinger
//
//  Created by Izu Eneh on 2023-06-01.
//

import SwiftUI

struct EditScrumSheet: View {
    @Binding var scrum: DailyScrum
    @Binding var editingScrum: DailyScrum
    @Binding var isPresentingEditScrumView: Bool
    
    
    var body: some View {
        NavigationStack {
            DetailEditView(scrum: $editingScrum)
                .navigationTitle(scrum.title)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isPresentingEditScrumView = false
                        }
                    }
                    
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            scrum = editingScrum
                            isPresentingEditScrumView = false
                        }
                    }
                }
        }
    }
}

struct EditScrumSheet_Previews: PreviewProvider {
    static var previews: some View {
        EditScrumSheet(scrum: .constant(DailyScrum.sampleData[0]), editingScrum: .constant(DailyScrum.sampleData[0]), isPresentingEditScrumView: .constant(true))
    }
}
