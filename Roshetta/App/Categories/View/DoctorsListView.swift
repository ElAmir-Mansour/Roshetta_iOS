//
//  DoctorsListView.swift
//  Roshetta
//
//  Created by Abdelrahman Esmail on 27/11/2023.
//

import SwiftUI

struct DoctorsListView: View {
    var body: some View {
        NavigationView {
            ScrollView (.vertical, showsIndicators: false) {
                VStack {
                    LazyVGrid(columns: grids, spacing: 14) {
                        ForEach(vm.guides) { guide in
                            GuideCard(image: guide.personal_photo,
                                      guideName: "Abdalarhamn",
                                      rating: guide.rate,
                                      location: guide.address)
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Tour Guides")
            .navigationBarTitleDisplayMode(.automatic)
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        }
    }
}

#Preview {
    DoctorsListView()
}
