//
//  CalendarViewModel.swift
//  CampusCal
//
//  Created by Ryan Nair on 3/17/24.
//

import SwiftUI

struct Event: Identifiable {
    let id: UUID
    let title: String
    let org: String
    let startDate: Date
    let endDate: Date
    let color: Color
    let url: URL
    let votes: Int
    let description: String
}

struct CodableEvent: Codable {
    let id: UUID
    let title: String
    let org: String
    let starttime: String
    let endtime: String
    let university: String
    let url: URL
    let votes: Int
    let description: String
    let type: String
}

struct EventsResponse: Decodable {
    let result: String
    let events: Dictionary<Int, CodableEvent>
}

struct OrganizationInfo: Decodable {
    let uuid: UUID
    let result: String
    let owner: String
    let description: String
}

struct VoteResponse: Decodable {
    let result: String
    let votes: Int
}

private extension Date {
    var startOfDay: Date {
        Calendar.current.startOfDay(for: self)
    }
}

@Observable
class CalendarViewModel {
    
    private(set) var groupedEvents: [Date: [Event]]?
    private let baseURL = URL(string: "https://api.campuscal.tech/").unsafelyUnwrapped
    
    private func dateFromUnixTimestampString(_ timestamp: String) -> Date {
        guard let timeInterval = TimeInterval(timestamp) else {
            return Date()
        }
        return Date(timeIntervalSince1970: timeInterval)
    }
    
    func listEvents(userUUID: String, tailored: Bool? = nil) async {
        var url = baseURL.appending(component: "events", directoryHint: .notDirectory)
        url.append(queryItems:[URLQueryItem(name: "user_uuid", value: userUUID)])
        if let tailored {
            url.append(queryItems:[URLQueryItem(name: "tailored", value: String(tailored))])
        }
        let request = URLRequest(url: url)
        
        guard let data = try? await URLSession.shared.data(for: request).0 else {
            print("Received non-200 HTTP response")
            groupedEvents = [:]
            return
        }
        
        let decoder = JSONDecoder()
        guard let eventsResponse = try? decoder.decode(EventsResponse.self, from: data) else {
            print("Couldn't decode properly")
            groupedEvents = [:]
            return
        }
        
        let events = eventsResponse.events.values.map { decodedEvent -> Event in
            let color: Color = switch decodedEvent.type {
            case "user" : .orange
            case "sponsored" : .yellow
            default: .blue
            }
            return Event(
                id: decodedEvent.id,
                title: decodedEvent.title,
                org: decodedEvent.org,
                startDate: dateFromUnixTimestampString(decodedEvent.starttime),
                endDate: dateFromUnixTimestampString(decodedEvent.endtime),
                color: color, 
                url: decodedEvent.url,
                votes: decodedEvent.votes,
                description: decodedEvent.description
            )
        }
        
        groupedEvents = Dictionary(grouping: events) { $0.startDate.startOfDay }
    }
    
    func voteEvent(eventUUID: String, isUpvote: Bool) async -> Int? {
        var url = baseURL.appending(component: "event", directoryHint: .notDirectory)
        if isUpvote {
            url.append(component: "upvote")
        }
        else {
            url.append(component: "downvote")
        }
        
        url.append(queryItems: [URLQueryItem(name: "event_uuid", value: eventUUID)])
        
        let request = URLRequest(url: url)
        guard let data = try? await URLSession.shared.data(for: request).0 else {
            print("Request for data failed")
            return nil
        }
        
        let decoder = JSONDecoder()
        let voteResponse = try! decoder.decode(VoteResponse.self, from: data)
        
        return voteResponse.votes
    }
}
