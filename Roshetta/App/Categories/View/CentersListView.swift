//
//  CentersListView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 27/11/2023.
//

import SwiftUI

struct CentersListView: View {
    // MARK: - PROPERTY
    let columnSpacing: CGFloat = 10
    let rowSpacing: CGFloat = 10
    var gridLayout: [GridItem] {
      return Array(repeating: GridItem(.flexible(), spacing: rowSpacing), count: 2)
    }
    
    // MARK: - VIEW
    var body: some View {
        NavigationView {
            ScrollView (.vertical, showsIndicators: false) {
                VStack {
                    LazyVGrid(columns: gridLayout, spacing: 15, content: {
                        MedicalCenterCard(
                            image: Image("clinc"),
                            name: "The Care",
                            rate: 3,
                            minPrice: "400",
                            maxPrice: "600",
                            location: "Mansoura, Dakahlia"
                        )
                        MedicalCenterCard(
                            image: Image("clinc"),
                            name: "The Care",
                            rate: 3,
                            minPrice: "400",
                            maxPrice: "600",
                            location: "Mansoura, Dakahlia"
                        )
                        MedicalCenterCard(
                            image: Image("clinc"),
                            name: "The Care",
                            rate: 3,
                            minPrice: "400",
                            maxPrice: "600",
                            location: "Mansoura, Dakahlia"
                        )
                    }) //: GRID
                    .padding(10)
                }
            }
            .navigationTitle("Clinics")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}


struct CentersListView_Previews: PreviewProvider {
    static var previews: some View {
        CentersListView()
    }
}
