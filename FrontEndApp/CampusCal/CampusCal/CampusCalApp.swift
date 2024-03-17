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
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if !hasLaunched {
                    AccountView(hasStarted: $hasLaunched)
                        .transition(.move(edge: .leading).combined(with: .opacity))
                } else {
                    TabView {
                        CalendarView(events: sampleEvents)
                            .tabItem {
                                Label("Message", systemImage:"bubble")
                            }
                        CalendarView(events: sampleEvents)
                            .tabItem {
                                Label("Calendar", systemImage:"calendar")
                            }
                        AboutView()
                            .tabItem {
                                Label("Settings", systemImage: "gear")
                            }
                    }
                    .transition(.move(edge: .trailing).combined(with: .opacity))
                }
            }
        }
    }
}
