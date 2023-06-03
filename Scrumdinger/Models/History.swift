//
//  History.swift
//  Scrumdinger
//
//  Created by Izu Eneh on 2023-06-03.
//

import Foundation


struct History: Identifiable {
    let id: UUID
    let date: Date
    let attendees: [DailyScrum.Attendee]
    
    init(id: UUID = UUID(), date: Date = Date(), attendees: [DailyScrum.Attendee]) {
        self.id = id
        self.date = date
        self.attendees = attendees
    }
}
