//
//  FavouritesSingleListItemView.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 05/04/2024.
//

import SwiftUI

struct FavouritesSingleListItemView: View {
    @State var model : FavouritesModelClass
    var body: some View {
        HStack(alignment: .center, spacing: 10){

            Circle()
                .fill(.primaryGreen)
                .frame(width: 40, height: 40)
                .overlay(
                    Image(model.icon)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .colorMultiply(.black)
                )


            Text(model.name)
                .font(.custom("AvenirNext-Medium", size: 14))
                .foregroundStyle(.white)

        }
        .padding(.top, 10)
        .padding(.bottom, 10)

    }
}

#Preview {
    FavouritesSingleListItemView(model: FavouritesModelClass(name: "Bill Manager", icon: "shield", type: "", is_shortcut: false))
}
