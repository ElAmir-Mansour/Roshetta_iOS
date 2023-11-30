//
//  DoctorsListView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 27/11/2023.
//

import SwiftUI

struct DoctorsListView: View {
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
                    LazyVGrid(columns: gridLayout, spacing: 26, content: {
                        DoctorCard(image: Image("user"), name: "Abdalazem Saleh", specialization: "Surgery", rate: 3, price: "400", location: "Mansoura, Dakahlia")
                        DoctorCard(image: Image("user"), name: "Abdalazem Saleh", specialization: "Surgery", rate: 3, price: "400", location: "Mansoura, Dakahlia")
                        DoctorCard(image: Image("user"), name: "Abdalazem Saleh", specialization: "Surgery", rate: 3, price: "400", location: "Mansoura, Dakahlia")
                    }) //: GRID
                    .padding(14)
                }
            }
            .navigationTitle("Doctors")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}



struct DoctorsListView_Previews: PreviewProvider {
    static var previews: some View {
       ClinicsListView()
    }
}

