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
    @Binding var hasStarted: Bool
    
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
            
            VStack(alignment: .center,spacing: 20) {
                Text("Campus Calendar")
                    .font(.system(size:60))
                    .padding(.bottom, 70)
                    .foregroundStyle(.white)
                    .bold()
                    .frame(maxWidth: 300)
                
                Button(action: {
                    withAnimation {
                        hasStarted = true
                    }
                }, label: {
                    Text("Get Started")
                        .foregroundStyle(.black)
                        .fontWeight(.semibold)
                        .font(.title)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(.white)
                        .background(.regularMaterial)
                        .cornerRadius(10)
                        .shadow(radius: 3)
                })
            }
        }
        .ignoresSafeArea()
    }
}
#Preview {
    AccountView(hasStarted: .constant(false))
}
