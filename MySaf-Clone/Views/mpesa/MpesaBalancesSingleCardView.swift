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
                            .frame(width: 32, height: 32)
                            .scaledToFit()
                            .padding(.top, 15)

                        Text(model.name)
                            .font(.custom("AvenirNext-Medium", size: 15))
                            .foregroundStyle(Color.primaryText)
                            .multilineTextAlignment(.leading)

                        Spacer()
                    })

                )
        }
    }
}

#Preview {
    MpesaBalancesSingleCardView(model: CardModel(name: "", icon: "", type: ""))
}
