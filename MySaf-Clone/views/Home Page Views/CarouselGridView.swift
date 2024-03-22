//
//  CarouselGridView.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 22/03/2024.
//

import SwiftUI

struct CarouselGridView: View {

    var body: some View {
        HStack{

            TabView{
                ForEach(1...6, id: \.self) { item in

                }
            }
            .tabViewStyle(PageTabViewStyle())
            .accentColor(.primaryGreen)
            .frame(height: 180)
            .shadow(radius: 2)

            LazyVStack(content: {
                ForEach(1...2, id: \.self){ row in
                    RoundedRectangle(cornerRadius: 8)
                        .frame(height: 90)
                        .foregroundStyle(.cardBG)
                        .shadow(radius: 2)
                        .overlay(
                            Text("View my Balances")
                                .font(.custom("AvenirNext-Medium", size: 16))
                                .foregroundStyle(Color.primaryGreen)
                        )
                }
            })
            .padding(.top, 8)
            .padding(.leading, 8)
            .padding(.trailing, 8)


        }

        Spacer()

    }
}

#Preview {
    CarouselGridView()
}
