//
//  MpesaBalancesSingleCardView.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 02/04/2024.
//

import SwiftUI

struct MpesaBalancesSingleCardView: View {
    @State var model: CardModel

    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 8)
                .frame(height: 120)
                .foregroundStyle(.cardBG)
                .shadow(radius: 2)
                .overlay(
                    VStack(alignment: .center, content: {

                        Image(model.icon)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .scaledToFit()
                            .padding(.top, 30)

                        Text(model.name)
                            .font(.custom("AvenirNext-Medium", size: 14))
                            .foregroundStyle(Color.primaryText)
                            .multilineTextAlignment(.leading)

                        Spacer()
                    })

                )
                .padding(.leading, 2)
                .padding(.trailing, 2)
        }
    }
}

#Preview {
    MpesaBalancesSingleCardView(model: CardModel(name: "", icon: "globe", type: "M-PESA Global"))
}
