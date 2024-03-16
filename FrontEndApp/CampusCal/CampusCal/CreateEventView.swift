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
    }
    
    @State private var title: String = ""
    @State private var time: String = ""
    @State private var description: String = ""
    @FocusState private var focusedField: Field?
    var body: some View {
        VStack{
            Text("Create Event")
                .padding(.bottom, 10)
                .font(.system(size:50))
            
            VStack {
                TextField(
                    "Event Title",
                    text: $time
                )
                .disableAutocorrection(true)
                .focused($focusedField, equals: .title)
                .onSubmit {
                    focusedField = .startTime
                }
                .onAppear {
                    focusedField = .title
                }
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
