//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Izu Eneh on 2023-05-22.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
