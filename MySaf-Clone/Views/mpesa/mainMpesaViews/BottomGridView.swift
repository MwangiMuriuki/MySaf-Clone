//
//  BottomGridView.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 04/04/2024.
//

import SwiftUI

struct BottomGridView: View {
    var body: some View {
        Grid {
            GridRow {
                // MARK: - First Column
                NavigationLink {
                    MpesaMapKitView(linkToLoad: .constant("https://www.safaricom.co.ke/"))
                        .navigationViewStyle(.stack)
                } label: {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(height: 120)
                        .foregroundStyle(.cardBG)
                        .shadow(radius: 2)
                        .overlay(
                            VStack(alignment: .center, content: {

                                Image("goIcon")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .scaledToFit()
                                    .padding(.top, 30)

                                Text("M-PESA GO")
                                    .font(.custom("AvenirNext-DemiBold", size: 14))
                                    .foregroundStyle(Color.primaryText)
                                    .multilineTextAlignment(.leading)

                                Spacer()
                            })

                        )
                        .padding(.leading, 2)
                        .padding(.trailing, 2)
                }

                // MARK: - Second Column
                NavigationLink {
                    MpesaMapKitView(linkToLoad: .constant("https://m-pesaforbusiness.co.ke/"))
                } label: {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(height: 120)
                        .foregroundStyle(.cardBG)
                        .shadow(radius: 2)
                        .overlay(
                            VStack(alignment: .center, content: {

                                Image("briefcase")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .scaledToFit()
                                    .padding(.top, 20)

                                Text("Lipa Na M-PESA Portal")
                                    .font(.custom("AvenirNext-DemiBold", size: 14))
                                    .foregroundStyle(Color.primaryText)
                                    .multilineTextAlignment(.leading)

                                Text("Apply for Till & Paybill solutions to colect & disburse funds")
                                    .font(.custom("AvenirNext", size: 12))
                                    .foregroundStyle(Color.primaryText)
                                    .multilineTextAlignment(.center)
                                    .lineLimit(2)
                                    .padding(.leading, 5)
                                    .padding(.trailing, 5)

                                Spacer()
                            })

                        )
                        .padding(.leading, 2)
                        .padding(.trailing, 2)
                }
                .gridCellColumns(2)

            }
        }
    }
}

#Preview {
    BottomGridView()
}
