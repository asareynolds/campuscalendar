//
//  CalendarView.swift
//  CampusCal
//
//  Created by Ryan Nair on 3/16/24.
//

import SwiftUI
import AlertToast
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
    Event(title: "Meeting with Alex", startDate: Date(), endDate: Date().addingTimeInterval(3600), color: .blue, description: "This event involves meeting Alex, eating food with him, and flying an airplane for the first time. Anyone is welcome."),
    Event(title: "Lunch with Sam", startDate: Date().addingTimeInterval(3600 * 24), endDate: Date().addingTimeInterval((3600 * 24) + 3600), color: .green, description: "Casual lunch at the park. Rember to bring your rain jacket!"),
    // Add more events...
]
struct EventInDetail: View{
    let event: Event
    var body: some View{
        VStack{
            Text(event.title)
                .font(.largeTitle)
            Text(event.description)
            
        }
    }
}
struct EventRow: View {
    let event: Event
    @State private var isExpanded = false
    @AppStorage("customTintColor") var colorBlind =  false
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    self.isExpanded.toggle()
                }
            }) {
                HStack {
                    if colorBlind {
                        Image(systemName: "checkmark")
                    }
                    else{
                        Rectangle()
                            .fill(event.color)
                            .frame(width: 5)
                        .cornerRadius(2.5)}
                    
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
            if isExpanded {
                VStack(alignment: .leading) {
                    Text(event.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.leading, 16)
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}


struct CalendarView: View {
    var events: [Event]
    @State private var showToast: Bool = false
    @State private var showAddView: Bool = false
    
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
                                            Task {
                                                let store = EKEventStore()
                                                guard try await store.requestWriteOnlyAccessToEvents() else {
                                                    return
                                                }
                                                let calEvent = EKEvent(eventStore: store)
                                                calEvent.calendar = store.defaultCalendarForNewEvents
                                                calEvent.title = event.title
                                                calEvent.startDate = event.startDate
                                                calEvent.endDate = event.endDate
                                                calEvent.notes = event.description
                                                showToast = true
                                            }
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
            .toast(isPresenting: $showToast) {
                AlertToast(type: .systemImage("calendar.badge.checkmark", Color(uiColor: .label)), title: "Added to calendar", style: .style(backgroundColor: Color(uiColor: .systemBackground)))
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Add Class", systemImage: "calendar.badge.plus", action: {
                        showAddView = true
                    })
                }
            }
            .sheet(isPresented: $showAddView, content: {
                CreateEventView()
            })
            .navigationTitle("Events")
        }
    }
}

#Preview {
    CalendarView(events: sampleEvents)
}

