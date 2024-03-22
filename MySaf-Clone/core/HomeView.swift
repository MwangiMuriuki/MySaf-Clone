//
//  HomeView.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 22/03/2024.
//

import SwiftUI

struct HomeView: View {
    
    let columns: [GridItem] = Array(repeating: .init(.adaptive(minimum: (UIScreen.main.bounds.width / 2) - 5, maximum: 197)), count: 2)

    var body: some View {
        VStack(content: {
            
            HomeHeaderView()

            ScrollView(.vertical) {

                UpdatesView()

                CarouselGridView()

                LazyVGrid(columns: columns, content: {
                    ForEach(1...10, id: \.self){row in
                        RoundedRectangle(cornerRadius: 8)
                            .frame(height: 90)
                            .foregroundStyle(.cardBG)
                            .shadow(radius: 2)
                            .overlay(
                                Text("Menu Item")
                                    .font(.custom("AvenirNext-Medium", size: 16))
                                    .foregroundStyle(Color.primaryGreen)
                            )
                    }
                })
                .padding(.top, 0)
                .padding(.leading, 8)
                .padding(.trailing, 8)
                .padding(.bottom, 8)

            }
            .padding(.top, 30)

        })


    }
}

#Preview {
    HomeView()
}
