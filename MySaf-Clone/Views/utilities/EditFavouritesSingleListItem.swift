//
//  EditFavouritesSingleListItem.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 05/04/2024.
//

import SwiftUI

struct EditFavouritesSingleListItem: View {
    @State var model : FavouritesModelClass

    var body: some View {
        HStack(alignment: .center, spacing: 3){

            if model.is_shortcut == true {
                Image("iconMinus")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            else{
                Image("iconAdd")
                    .resizable()
                    .frame(width: 20, height: 20)
            }


            Circle()
                .fill(.primaryGreen)
                .frame(width: 30, height: 30)
                .overlay(
                    Image(model.icon)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 15, height: 15)
                        .colorMultiply(.primaryText)
                )
                .padding(.trailing, 5)


            Text(model.name)
                .font(.custom("AvenirNext-DemiBold", size: 14))
                .foregroundStyle(.secondaryText)

            Spacer(minLength: 0)

            if model.is_shortcut == true {
                Image(systemName: "line.3.horizontal")
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.secondaryText)
            }
            else{
             
            }



        }
        .padding(3)
    }
}

#Preview {
    EditFavouritesSingleListItem(model: FavouritesModelClass(name: "Bill Manager", icon: "chart", type: "", is_shortcut: true))
}
