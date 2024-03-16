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
}

extension Date {
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
}

let sampleEvents: [Event] = [
    Event(title: "Meeting with Alex", date: Date(), color: .blue),
    Event(title: "Lunch with Sam", date: Date().addingTimeInterval(3600 * 24), color: .green),
    // Add more events...
]


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
                        HStack {
                            Circle()
                                .fill(event.color)
                                .frame(width: 10, height: 10)
                            Text(event.title)
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

