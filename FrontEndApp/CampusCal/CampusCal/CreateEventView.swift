//
//  CreateEventView.swift
//  CampusCal
//
//  Created by Eva Gunn on 3/16/24.
//

import SwiftUI

struct CreateEventView: View {
    enum Field: Hashable {
        case title
        case startTime
        case endTime
        case description
        case url
    }
    
    @State private var title: String = ""
    @State private var startTime: Date = Date()
    @State private var endTime: Date = Date()
    @State private var description: String = ""
    @State private var url: String = ""
    @FocusState private var focusedField: Field?
    var body: some View {
        VStack(spacing: 10){
            Text("Create Event")
                .padding(.bottom, 30)
                .font(.system(size:50))
            
            VStack {
                TextField(
                    "Event Title",
                    text: $title
                )
                .disableAutocorrection(true)
                .focused($focusedField, equals: .title)
                .onSubmit {
                    focusedField = .startTime
                }
                .onAppear {
                    focusedField = .title
                }
                DatePicker(
                    "Start Date",
                    selection: $startTime,
                    displayedComponents: [.date, .hourAndMinute]
                )
                DatePicker(
                    "End Time",
                    selection: $startTime,
                    displayedComponents: [.hourAndMinute]
                )
                
                TextField(
                    "Description",
                    text: $description
                )
                .disableAutocorrection(true)
                .onSubmit {
                    focusedField = .startTime
                }
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 20)
        }
    }
}
#Preview {
    CreateEventView()
}
