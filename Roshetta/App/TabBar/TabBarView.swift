//
//  TabBarView.swift
//  Roshetta
//
//  Created by Abdalazem Saleh on 2023-11-10.
//

import SwiftUI

struct TabBar: Identifiable {
    var id = UUID()
    var iconname: String
    var tab: TabIcon
    var index: Int
}

let tabItems = [
    TabBar(iconname: "house.fill", tab: .Home, index: 0),
    TabBar(iconname: "message.fill", tab: .Favorite, index: 1),
    TabBar(iconname: "circle.hexagongrid.fill", tab: .Scanner, index: 2),
    TabBar(iconname: "tray.circle.fill", tab: .Ai, index: 3),
    TabBar(iconname: "person.fill", tab: .Profile, index: 4)]

enum TabIcon: String {
    case Home
    case Favorite
    case Scanner
    case Ai
    case Profile
}

struct TabBarView: View {
    @State var selectedTap: TabIcon = .Home
    @State var offset = 0.0
    @Namespace private var animationNameSpace
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTap {
                case .Home:
                    AuthView()
                case .Favorite:
                    Text("Fav")
                case .Scanner:
                    Text("Scanner")
                case .Ai:
                    Text("Ai")
                case .Profile:
                    Text("Profile")
                }
            }
            
            HStack(alignment: .center) {
                ForEach(tabItems) { item in
                    Spacer()
                    VStack {
                        if selectedTap == item.tab {
                            Capsule()
                                .foregroundColor(.white)
                                .frame(height: 4)
                                .padding(.top, 2)
                                .matchedGeometryEffect(id: "SelectedTapId", in: animationNameSpace)
                        }
                        Spacer()
                        
                        Image(systemName: item.iconname)
                            .foregroundColor(.white)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedTap = item.tab
                                }
                            }
                        
                        Spacer()
                    }
                    .frame(width: 32)
                    Spacer()
                }
            }
            .frame(height: 60)
            .background(.black, in: RoundedRectangle(cornerRadius: 8))
            .padding()
            .padding(.bottom, 12)
        }
        .ignoresSafeArea()
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .previewLayout(.sizeThatFits)
    }
}
