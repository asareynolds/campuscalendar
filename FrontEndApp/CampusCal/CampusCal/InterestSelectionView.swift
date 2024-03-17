//
//  InterestSelectionView.swift
//  CampusCal
//
//  Created by Ryan Nair on 3/17/24.
//

import SwiftUI

struct InterestsView: View {
    var viewModel = InterestsViewModel()
    
    private let layout = [GridItem(.adaptive(minimum: 118), spacing: 10)]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Select your interests")
                .font(.largeTitle)
                .foregroundStyle(.black)
                .padding()
            
            LazyVGrid(columns: layout, spacing: 20) {
                ForEach(viewModel.allInterests, id: \.self) { interest in
                    Button(action: { viewModel.toggleInterest(interest) }) {
                        Text(interest)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(viewModel.selectedInterests.contains(interest) ? .white : .black)
                            .background(viewModel.selectedInterests.contains(interest) ? .orange : .white)
                            .clipShape(Capsule())
                            .shadow(radius: 3)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}


    


struct ClubsView: View {
    @State private var viewModel = InterestsViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                InterestsView(viewModel: viewModel)
                Button("Submit") {

                }
                .buttonStyle(.borderedProminent)
                .font(.title)
                .buttonBorderShape(.roundedRectangle(radius: 8))
                .shadow(radius: 4)
                .padding(.bottom, 20)
            }
            .padding()
        }
    }
}


#Preview {
    ClubsView()
}
