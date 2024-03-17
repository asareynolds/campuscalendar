//
//  CampusCalApp.swift
//  CampusCal
//
//  Created by Ryan Nair on 3/16/24.
//

import SwiftUI
import SwiftData

@main
struct CampusCalApp: App {
    @State private var hasLaunched: Bool = false
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {

                ZStack {
                    if !hasLaunched {
                        AccountView(hasStarted: $hasLaunched)
                    }
                    else {
                        TabView{
                            CalendarView(events: sampleEvents)
                                .modelContainer(sharedModelContainer)
                                .tabItem {
                                    Label("Message", systemImage:"bubble.circle" )
                                }
                            if hasLaunched {
                                CalendarView(events: sampleEvents)
                                    .tabItem {
                                        Label("Calendar", systemImage:"calendar.circle")
                                    }
                                CalendarView(events: sampleEvents)
                                    .tabItem {
                                        Label("Home", systemImage: "gear.circle")
                                    }
                                
                            }
                        }
                    }
                }
                .transition(.asymmetric(insertion: .move(edge: .trailing).combined(with: .opacity), removal: AnyTransition.move(edge: .leading).combined(with: .opacity)))
            }
            .modelContainer(sharedModelContainer)
        }
    }
