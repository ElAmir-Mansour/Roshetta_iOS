//
//  ClinicsListView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 27/11/2023.
//

import SwiftUI

struct ClinicsListView: View {
    // MARK: - PROPERTY
    let columnSpacing: CGFloat = 5
    let rowSpacing: CGFloat = 5
    var gridLayout: [GridItem] {
      return Array(repeating: GridItem(.flexible()), count: 1)
    }
    
    // MARK: - VIEW
    var body: some View {
        NavigationView {
            ScrollView (.vertical, showsIndicators: false) {
                VStack {
                    LazyVGrid(columns: gridLayout, content: {
                        ClincCard(image: Image("clinc"), name: "The Care", rate: 3, price: "400", location: "Mansoura, Dakahlia")
                        ClincCard(image: Image("clinc"), name: "The Care", rate: 3, price: "400", location: "Mansoura, Dakahlia")
                        ClincCard(image: Image("clinc"), name: "The Care", rate: 3, price: "400", location: "Mansoura, Dakahlia")
                        ClincCard(image: Image("clinc"), name: "The Care", rate: 3, price: "400", location: "Mansoura, Dakahlia")
                    }) //: GRID
                }
            }
            .navigationTitle("Clinics")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

#Preview {
    ClinicsListView()
}
