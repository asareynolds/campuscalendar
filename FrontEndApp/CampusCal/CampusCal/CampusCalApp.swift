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
    @State private var hasLaunched: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if !hasLaunched {
                    AccountView(hasStarted: $hasLaunched)
                        .transition(.move(edge: .leading).combined(with: .opacity))
                } else {
                    TabView {
                        CalendarView()
                            .tabItem {
                                Label("Message", systemImage:"bubble")
                            }
                        ClubsView()
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
