//
//  CreateEventView.swift
//  CampusCal
//
//  Created by Eva Gunn on 3/16/24.
//

import SwiftUI

private func createEvent(title: String, startTime: String, endTime: String, description: String) async -> (result: String?, uuid: String?) {
    let baseURL = URL(string: "https://api.campuscal.tech/").unsafelyUnwrapped
    let url = baseURL.appending(components: "event", "create", directoryHint: .notDirectory)
    let codableEvent = CodableEvent(id: UUID(), title: title, org: "", starttime: startTime, endtime:endTime, university: "", url: baseURL, votes: 0, description: description, type: "")
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    do {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        request.httpBody = try encoder.encode(codableEvent)
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            print("Received non-200 HTTP response")
            return (nil, nil)
        }
        
        let decoder = JSONDecoder()
        if let creationResponse = try? decoder.decode(VoteResponse.self, from: data) {
            return (creationResponse.result, nil)
        } else {
            print("Failed to decode response")
            return (nil, nil)
        }
    } catch {
        print("Request failed with error: \(error)")
        return (nil, nil)
    }
}

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
    @State private var description: String = "This event is to bring together people who love coding!...."
    @State private var url: String = ""
    @FocusState private var focusedField: Field?
    
    var body: some View {
        VStack(spacing: 10){
            Text("Create Event")
                .padding(.vertical, 25)
                .font(.system(size:50))
            
            VStack {
                TextField("Event Title", text: $title)
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
                .focused($focusedField, equals: .startTime)
                DatePicker(
                    "End Time",
                    selection: $endTime,
                    displayedComponents: [.hourAndMinute]
                )
                .focused($focusedField, equals: .endTime)
                .onSubmit {
                    focusedField = .description
                }
                
                TextEditor(text: $description)
                .focused($focusedField, equals: .description)
                .disableAutocorrection(true)
                .onSubmit {
                    focusedField = nil
                }
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 20)
            Button("Submit") {
                Task {
                    let dateFormatter = ISO8601DateFormatter()
                    let (result, _) = await createEvent(title: title, startTime: dateFormatter.string(from: startTime), endTime: dateFormatter.string(from: endTime), description: description)
                }
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 8))
            .shadow(radius: 4)
            .padding(.bottom, 20)
            

        }

        }
    }
#Preview {
    CreateEventView()
}
