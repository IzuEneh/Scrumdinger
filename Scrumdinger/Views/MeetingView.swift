//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Izu Eneh on 2023-05-22.
//

import SwiftUI
import AVFoundation

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer = ScrumTimer()
    @StateObject var speechRecognizer = SpeechRecognizer()
    @State var isRecording = false
    
    private var player: AVPlayer { AVPlayer.sharedDingPlayer}
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
                MeetingTimerView(speakers: scrumTimer.speakers, theme: scrum.theme, isRecording: isRecording)
                MeetingFooterView(speakers: scrumTimer.speakers) {
                    scrumTimer.skipSpeaker()
                }
            }
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .onAppear{
            startScrum()
        }
        .onDisappear {
            endScrum()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    fileprivate func startScrum() {
        scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
        scrumTimer.speakerChangedAction =  {
            player.seek(to: .zero)
            player.play()
        }
        
        speechRecognizer.resetTranscript()
        speechRecognizer.startTranscribing()
        isRecording = true
        scrumTimer.startScrum()
    }
    
    fileprivate func endScrum() {
        speechRecognizer.stopTranscribing()
        isRecording = false
        scrumTimer.stopScrum()
        let newHistory = History(attendees: scrum.attendees, transcript: speechRecognizer.transcript)
        scrum.history.insert(newHistory, at: 0)
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
