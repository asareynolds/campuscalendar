//
//  CalendarView.swift
//  CampusCal
//
//  Created by Ryan Nair on 3/16/24.
//

import SwiftUI
import EventKit

struct Event: Identifiable {
    let id = UUID()
    let title: String
    let startDate: Date
    let endDate: Date
    let color: Color
    let description: String
}

extension Date {
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
}

let sampleEvents: [Event] = [
    Event(title: "Meeting with Alex", startDate: Date(), endDate: Date().addingTimeInterval(3600), color: .blue, description: "Discuss project status."),
    Event(title: "Lunch with Sam", startDate: Date().addingTimeInterval(3600 * 24), endDate: Date().addingTimeInterval((3600 * 24) + 3600), color: .green, description: "Casual lunch at the park."),
    // Add more events...
]

struct EventRow: View {
    let event: Event
    
    var body: some View {
        return NavigationLink {
            Text(event.description)
        } label: {
            HStack {
                Rectangle()
                    .fill(event.color)
                    .frame(width: 5)
                    .cornerRadius(2.5)
                
                VStack(alignment: .leading) {
                    Text(event.title)
                        .font(.headline)
                    Text(event.startDate...event.endDate)
                        .font(.subheadline)
                }
                .padding(.leading, 8)
                
                Spacer()
            }
            .padding()
        }
    }
}


struct CalendarView: View {
    var events: [Event]
    
    private var groupedEvents: [Date: [Event]] {
        Dictionary(grouping: events) { $0.startDate.startOfDay }
    }
    
    private var sortedDates: [Date] {
        groupedEvents.keys.sorted()
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(sortedDates, id: \.self) { date in
                    Section {
                        if let events = groupedEvents[date] {
                            ForEach(events) { event in
                                EventRow(event: event)
                                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                                        Button {
                                            print("Upvote \(event.title)")
                                            // Implement upvote action here
                                        } label: {
                                            Label("Upvote", systemImage: "arrow.up")
                                        }
                                        .tint(.orange)
                                        
                                        Button {
                                            print("Downvote \(event.title)")
                                            // Implement upvote action here
                                        } label: {
                                            Label("Downvote", systemImage: "arrow.down")
                                        }
                                        .tint(.indigo)
                                    }
                                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                        Button {
                                            let store = EKEventStore()
                                            store.requestWriteOnlyAccessToEvents(completion: { _,_ in
                                                let calEvent = EKEvent(eventStore: store)
                                                calEvent.calendar = store.defaultCalendarForNewEvents
                                                calEvent.title = event.title
                                                calEvent.startDate = event.startDate
                                                calEvent.endDate = event.endDate
                                                calEvent.notes = event.description
                                                
                                                try? store.save(calEvent, span: .thisEvent)
                                                
                                            })
                                        } label: {
                                            Label("Add", systemImage: "plus")
                                        }
                                        .tint(.blue)
                                    }
                            }
                        }
                    } header: {
                        Text(date.formatted(date: .abbreviated, time: .omitted))
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Add Class", systemImage: "calendar.badge.plus", action: {
                        // to do
                    })
                }
            }
        }
    }
}

#Preview {
    CalendarView(events: sampleEvents)
}

