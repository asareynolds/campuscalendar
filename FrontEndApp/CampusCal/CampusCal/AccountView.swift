//
//  AccountView.swift
//  CampusCal
//
//  Created by Ryan Nair on 3/16/24.
//

import SwiftUI

struct AccountView: View {
    @State private var colors: [Color] = [.red, .green, .blue, .yellow, .orange, .purple, .pink]
    @State private var currentColorIndex = 0
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [
                    colors[currentColorIndex],
                    colors[(currentColorIndex + 1) % colors.count]
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .animation(.linear(duration: 5).repeatForever(), value: currentColorIndex)
            .onAppear {
                withAnimation(.linear(duration: 5)) {
                    currentColorIndex = Int.random(in: 0...6)
                }
            }
            
            VStack(spacing: 20) {
                Text("Welcome")
                    .font(.title)
                    .bold()
                
                Button(action: {
                    // Handle "Create Account" action
                }) {
                    Text("Create Account")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(.blue)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    // Handle "Log In" action
                }) {
                    Text("Log In")
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(.green)
                        .cornerRadius(10)
                }
            }
        }
        .ignoresSafeArea()
    }
}
#Preview {
    AccountView()
}
