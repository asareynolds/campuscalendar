//
//  CalendarView.swift
//  CampusCal
//
//  Created by Ryan Nair on 3/16/24.
//

import SwiftUI

struct Event: Identifiable {
    var id = UUID()
    var title: String
    var date: Date
    var color: Color
    var description: String
}

extension Date {
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
}

let sampleEvents: [Event] = [
    Event(title: "Meeting with Alex", date: Date(), color: .blue, description: "Discuss project status."),
    Event(title: "Lunch with Sam", date: Date().addingTimeInterval(3600 * 24), color: .green, description: "Casual lunch at the park."),
    // Add more events with descriptions...
]

struct EventRow: View {
    var event: Event
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(event.color)
                .frame(width: 5)
                .cornerRadius(2.5)
            
            VStack(alignment: .leading) {
                Text(event.title)
                    .font(.headline)
                Text(event.date, format: .dateTime.hour().minute())
                    .font(.subheadline)
                Text(event.description)
                    .font(.caption)
            }
            .padding(.leading, 8)
            
            Spacer()
        }
        .padding()
//        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 1))
    }
}


struct CalendarView: View {
    var events: [Event]
    
    // Group events by date
    private var groupedEvents: [Date: [Event]] {
        Dictionary(grouping: events) { $0.date.startOfDay }
    }
    
    // Sorted dates for iteration
    private var sortedDates: [Date] {
        groupedEvents.keys.sorted()
    }
    
    var body: some View {
        List {
            ForEach(sortedDates, id: \.self) { date in
                Section {
                    ForEach(groupedEvents[date] ?? []) { event in
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
                                    print("Add \(event.title)")
                                    // Implement add event action here Use alert toast here
                                } label: {
                                    Label("Add", systemImage: "plus")
                                }
                                .tint(.blue)
                            }
                    }
                } header: {
                    Text(date.formatted(date: .abbreviated, time: .omitted))
                }
            }
        }
    }
}

#Preview {
    CalendarView(events: sampleEvents)
}

