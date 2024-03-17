//
//  CalendarView.swift
//  CampusCal
//
//  Created by Ryan Nair on 3/16/24.
//

import SwiftUI
import AlertToast
import EventKit

private struct EventInDetail: View{
    let event: Event
    var body: some View{
        VStack{
            Text(event.title)
                .font(.largeTitle)
            Text(event.description)
            Link(destination: event.url) {
                Text(event.url.lastPathComponent)
            }
        }
    }
}

private struct EventRow: View {
    let event: Event
    @State private var isExpanded = false
    @AppStorage("customTintColor") private var colorBlind =  false
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    self.isExpanded.toggle()
                }
            }) {
                HStack {
                    if colorBlind {
                        Image(systemName: event.color == .blue ?  "building.2" : "person.fill")
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
                    Link("\(event.url)", destination: event.url)
                        .font(.subheadline)
                        .foregroundColor(.blue)
                        .padding()
                
                }
            }
        }
        .buttonStyle(.plain)
    }
}

struct CalendarView: View {
    @State private var showToast: Bool = false
    @State private var showAddView: Bool = false
    @State var model = CalendarViewModel()
    let currentUser = "0b4a270e-243a-496b-9f67-4aedf50f9622"
    
    var body: some View {
        NavigationStack {
            List {
                if let groupedEvents = model.groupedEvents {
                    if !groupedEvents.isEmpty {
                        ForEach(groupedEvents.keys.sorted(), id: \.self) { date in
                            Section {
                                if let events = groupedEvents[date] {
                                    ForEach(events) { event in
                                        EventRow(event: event)
                                            .swipeActions(edge: .leading) {
                                                Button {
                                                    Task {
                                                        await model.voteEvent(eventUUID: event.id.description, isUpvote: true)
                                                    }
                                                } label: {
                                                    Label("Upvote", systemImage: "arrow.up")
                                                }
                                                .tint(.orange)
                                                
                                                Button {
                                                    Task {
                                                        await model.voteEvent(eventUUID: event.id.description, isUpvote: false)
                                                    }
                                                } label: {
                                                    Label("Downvote", systemImage: "arrow.down")
                                                }
                                                .tint(.indigo)
                                            }
                                            .swipeActions(edge: .trailing) {
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
                                                        try? store.save(calEvent, span: .thisEvent)

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
                    else {
                        ContentUnavailableView("No Events Found", systemImage: "calendar.day.timeline.trailing")
                    }
                }
                else {
                  ProgressView()
                }
            }
            .task {
                await model.listEvents(userUUID: currentUser)
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
    CalendarView()
}

