//
//  HotDealsView.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 24/03/2024.
//

import SwiftUI

struct HotDealsView: View {
    
    @State var model: HotDealsModel
    @State var viewWidth = UIScreen.main.bounds.size.width - 100

    var body: some View {
        VStack(alignment: .leading, content: {
                RoundedRectangle(cornerRadius: 5)
                    .frame(height: 120)
                    .foregroundStyle(.primaryGreen)
                    .shadow(radius: 2)
                    .overlay(
                        VStack(alignment: .leading, content: {
                            Text("Get")
                                .font(.custom("AvenirNext-Medium", size: 15))
                                .foregroundStyle(Color.white)

                            Text(model.dealDetails)
                                .font(.custom("AvenirNext-DemiBold", size: 16))
                                .foregroundStyle(Color.white)
                                .multilineTextAlignment(.leading)
                                .padding(.top, 5)

                            HStack(content: {
                                Spacer()

                                Image("gift")
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundStyle(.white)
                                    .frame(width: 30, height: 30)
                                    .scaledToFit()
                            })
                            .padding(.trailing, 10)
                            .padding(.bottom, 10)



                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 20)
                        .padding(.top, 20)

                    )
        })
        .frame(width: viewWidth)
      

    }
}

#Preview {
    HotDealsView(model: HotDealsModel(id: 0, dealDetails: "Sh50 (Kredo 125, Midnight)"))
}
