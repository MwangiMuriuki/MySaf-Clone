//
//  HomeCardItemsView.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 23/03/2024.
//

import SwiftUI

struct HomeCardItemsView: View {

    @State var model: CardModel

    let columns: [GridItem] = Array(repeating: .init(.adaptive(minimum: (UIScreen.main.bounds.width / 2) - 5, maximum: 197)), count: 2)

    var body: some View {

        VStack{
            RoundedRectangle(cornerRadius: 8)
                .frame(height: 90)
                .foregroundStyle(.cardBG)
                .shadow(radius: 2)
                .overlay(
                    HStack{
                        Image(model.icon)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .scaledToFit()
                            .padding(8)

                        Text(model.name)
                            .font(.custom("AvenirNext-Medium", size: 16))
                            .foregroundStyle(Color.primaryGreen)
                            .multilineTextAlignment(.leading)

                        Spacer()
                    }

                )
        }


    }
}

#Preview {
    HomeCardItemsView(model: CardModel(name: "", icon: "", type: ""))

}
