//
//  InterestsViewModel.swift
//  CampusCal
//
//  Created by Ryan Nair on 3/16/24.
//

import SwiftUI

@Observable
class InterestsViewModel {
    
        let userID = "07198b4b-72ec-4d95-9fe8-fdf178e67cde"
        private let baseURL = URL(string: "https://api.campuscal.tech/").unsafelyUnwrapped
        private var recommendations: [String: Any]
        let allInterests: [String] =  ["Technical", "Social Gatherings", "Speakers", "Workshops", "Career and Networking", "Outdoor", "Wellness", "Cultural", "Science", "Hands-On", "Service","Religion","Athletics", "Free", "Concerts"]
    
        var selectedInterests: Set<String> {
            didSet {
                UserDefaults.standard.set(Array(selectedInterests), forKey: "selectedInterests")
            }
        }
    
        init() {
            selectedInterests = Set(UserDefaults.standard.stringArray(forKey: "selectedInterests") ?? [])
            recommendations = [:]
        }
    
        func toggleInterest(_ interest: String) {
            if selectedInterests.contains(interest) {
                selectedInterests.remove(interest)
            } else {
                selectedInterests.insert(interest)
            }
        }
    
    func getPreferences() async {
        var urlWithQuery = baseURL.appending(components: "user", "preferences", directoryHint: .notDirectory)
        urlWithQuery.append(queryItems: [URLQueryItem(name: "user_uuid", value: userID)])
        
        let getRequest = URLRequest(url: urlWithQuery)
        
        let (getData, getResponse) = try! await URLSession.shared.data(for: getRequest)
        guard let getHttpResponse = getResponse as? HTTPURLResponse, getHttpResponse.statusCode == 200 else {
            print("Failed to fetch preferences: Received non-200 HTTP response")
            return
        }
        
        guard let preferencesResult = try? JSONSerialization.jsonObject(with: getData) as? [String: String] else {
            print("Failed to decode fetched preferences")
            return
        }
        
        guard let decodedData = Data(base64Encoded: preferencesResult["preferences"]!) else {
            return
        }
        
        // Parse JSON Data into Array<String>
        guard let jsonArray = try? JSONSerialization.jsonObject(with: decodedData, options: []) as? [String] else {
            return
        }
        
        selectedInterests = Set(jsonArray)
    }
    
    func listEvents(userUUID: Stringl) async {
        var url = baseURL.appending(component: "events", directoryHint: .notDirectory)
        url.append(queryItems:[URLQueryItem(name: "user_uuid", value: userUUID), URLQueryItem(name: "tailored", value: "true")])
        let request = URLRequest(url: url)
        
        guard let data = try? await URLSession.shared.data(for: request).0 else {
            print("Received non-200 HTTP response")
            recommendations = [:]
            return
        }
        
        let decoder = JSONDecoder()
        guard let eventsResponse = try? decoder.decode(EventsResponse.self, from: data) else {
            print("Couldn't decode properly")
            recommendations = [:]
            return
        }
        
        let events = eventsResponse.events.values.map { decodedEvent -> Event in
            let color: Color = switch decodedEvent.type {
            case "user" : .orange
            case "sponsored" : .yellow
            default: .blue
            }
            
            var startDate = dateFromUnixTimestampString(decodedEvent.starttime)
            var endDate = dateFromUnixTimestampString(decodedEvent.endtime)
            if startDate >= endDate {
                (endDate, startDate) = (startDate, endDate)
            }
            return Event(
                id: decodedEvent.id,
                title: decodedEvent.title,
                org: decodedEvent.org,
                startDate: startDate,
                endDate: endDate,
                color: color,
                url: decodedEvent.url,
                votes: decodedEvent.votes,
                description: decodedEvent.description
            )
        }
        
        groupedEvents = Dictionary(grouping: events) { $0.startDate.startOfDay }
    }
    
    func updateRecommendations() async {
        if let jsonData = try? JSONSerialization.data(withJSONObject: Array(selectedInterests)) {
            let url = baseURL.appending(components: "user", "preferences", directoryHint: .notDirectory)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let requestBody: [String: String] = [
                "user_uuid": userID,
                "user_preferences": jsonData.base64EncodedString()
            ]
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: requestBody)
                
                let data = try await URLSession.shared.data(for: request).0
                if let result = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
                } else {
                    print("Failed to update preferences")
                }
            } catch {
                print("Request failed with error: \(error)")
            }
        }
    }

    func setUserPreferences(preferences: [String: Any]) async -> String? {
            let url = baseURL.appending(components: "user", "preferences", directoryHint: .notDirectory)
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            var requestBody = preferences
            requestBody["user_uuid"] = userID
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: requestBody)
                let (data, _) = try await URLSession.shared.data(for: request)
                let response = try JSONDecoder().decode([String: String].self, from: data)
                return response["result"]
            } catch {
                print("Request failed with error: \(error)")
                return nil
            }
        }
}
