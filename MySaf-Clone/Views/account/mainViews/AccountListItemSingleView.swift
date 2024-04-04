//
//  AccountListItemSingleView.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 04/04/2024.
//

import SwiftUI

struct AccountListItemSingleView: View {
    @State var model: CardModel

    var body: some View {
        HStack(content: {
            RoundedRectangle(cornerRadius: 8)
                .frame(height: 54)
                .foregroundStyle(.cardBG)
                .shadow(radius: 2)
                .overlay(
                    HStack(alignment: .center, spacing: 10){
                        Image(model.icon)
                            .resizable()
                            .frame(width: 20, height: 20)

                        Text(model.name)
                            .font(.custom("AvenirNext-Medium", size: 15))
                            .foregroundStyle(.primaryText)

                        Spacer(minLength: 0)

                        Image(systemName: "chevron.right")
                            .frame(width: 20, height: 20)
                            .foregroundStyle(.secondaryText)

                    }
                        .padding(8)
                )
                .padding(.top, 1)
                .padding(.leading, 10)
                .padding(.trailing, 10)
        })
    }
}

#Preview {
    AccountListItemSingleView(model: CardModel(name: "", icon: "", type: ""))
}
