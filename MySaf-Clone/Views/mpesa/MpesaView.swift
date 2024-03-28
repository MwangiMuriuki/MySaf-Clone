//
//  MpesaView.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 22/03/2024.
//

import SwiftUI

struct MpesaView: View {
    let columns: [GridItem] = Array(repeating: .init(.adaptive(minimum: (UIScreen.main.bounds.width / 2) - 5, maximum: 197)), count: 3)

    var body: some View {
        NavigationStack {

            NavigationLink {
                MpesaBalanceView()
                    .toolbar(content: {
                        ToolbarItem(placement: .principal) {
                            Text("M-PESA Balance")
                                .font(.custom("AvenirNext-DemiBold", size: 18))
                                .foregroundStyle(Color.white)
                        }
                    })
                    .toolbarBackground(Color.headerBG, for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
                    .toolbarColorScheme(.dark, for: .navigationBar)
            } label: {
                Text("Show Balance")
                    .font(.custom("AvenirNext-DemiBold", size: 16))
                    .foregroundStyle(Color.primaryGreen)
                    .frame(width: UIScreen.main.bounds.width - 50, height: 46)
                    .background(Color.cardBG)
                    .clipShape(Capsule())
                    .shadow(radius: 4)
            }
            .padding()

//            LazyVGrid(columns: columns, content: {
//                ForEach(0..<12, id: \.self){ item in
//                    let pageType: PageType = PageType(rawValue: item.type)!
//                    NavigationLink {
//                        chooseDestination(pageType: pageType, pageTitle: item.name)
//                    } label: {
//                        HomeCardItemsView(model: item)
//                    }
//                }
//            })
//            .padding(.top, 0)
//            .padding(.leading, 8)
//            .padding(.trailing, 8)
//            .padding(.bottom, 8)



            List(0..<50, id: \.self) { _ in
                NavigationLink("Row", destination: Text("Tapped on row"))
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("M-PESA")
                        .foregroundColor(.white)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.headerBG, for: .navigationBar)
        }

    }
}

#Preview {
    MpesaView()
}
