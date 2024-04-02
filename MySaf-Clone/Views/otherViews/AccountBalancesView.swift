//
//  AccountBalancesView.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 23/03/2024.
//

import SwiftUI

struct AccountBalancesView: View {

    @StateObject var viewModel = AccountBalancesViewModel()

    var data = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"]

    var body: some View {
        VStack(content: {
            List(viewModel.accountBalances){ item in

                DisclosureGroup(
                    content: {
                        VStack(alignment: .leading, spacing: 12, content: {
                            HStack(content: {
                                Text(item.altLabel)
                                    .font(.custom("AvenirNext-DemiBold", size: 15))
                                    .foregroundStyle(Color.gray)
                                    .multilineTextAlignment(.leading)

                                Spacer()

                                Text(item.altBalance)
                                    .font(.custom("AvenirNext-Medium", size: 15))
                                    .foregroundStyle(Color.gray)
                                    .multilineTextAlignment(.leading)
                            })

                            HStack(content: {
                                Text("Expiry")
                                    .font(.custom("AvenirNext-Medium", size: 15))
                                    .foregroundStyle(Color.gray)
                                    .multilineTextAlignment(.leading)

                                Spacer()

                                Text(item.expiry)
                                    .font(.custom("AvenirNext-Medium", size: 15))
                                    .foregroundStyle(Color.gray)
                                    .multilineTextAlignment(.leading)
                            })

                            // MARK: - CTA Section

                            if (item.hasSecondaryAction){
                                HStack(content: {
                                    // MARK: - Primary Action
                                    NavigationLink {

                                    } label: {
                                        RoundedRectangle(cornerRadius: 22)
                                            .strokeBorder(style: .init(lineWidth: 2))
                                            .frame(height: 45)
                                            .foregroundStyle(.primaryGreen)
                                            .shadow(radius: 0)
                                            .overlay(
                                                HStack{
                                                    Text(item.primaryAction.label)
                                                        .font(.custom("AvenirNext-Medium", size: 16))
                                                        .foregroundStyle(Color.primaryGreen)
                                                        .multilineTextAlignment(.leading)

                                                }

                                            )
                                    }

                                    // MARK: - Secondary Action
                                    NavigationLink {

                                    } label: {
                                        RoundedRectangle(cornerRadius: 22)
                                            .frame(height: 45)
                                            .foregroundStyle(.primaryGreen)
                                            .shadow(radius: 2)
                                            .overlay(
                                                HStack{
                                                    Text(item.secondaryAction.label)
                                                        .font(.custom("AvenirNext-Medium", size: 16))
                                                        .foregroundStyle(Color.white)
                                                        .multilineTextAlignment(.leading)

                                                }

                                            )
                                    }

                                })

                            }
                            else {
                                NavigationLink {

                                } label: {
                                    RoundedRectangle(cornerRadius: 22)
                                        .strokeBorder(style: .init(lineWidth: 2))
                                        .frame(height: 45)
                                        .foregroundStyle(.primaryGreen)
                                        .shadow(radius: 0)
                                        .overlay(
                                            HStack{
                                                Text(item.primaryAction.label)
                                                    .font(.custom("AvenirNext-Medium", size: 16))
                                                    .foregroundStyle(Color.primaryGreen)
                                                    .multilineTextAlignment(.leading)
                                            }

                                        )
                                }

                            }
                        })
                    },
                    label: {
                        HStack(content: {
                            Image(item.icon)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .scaledToFit()
                                .padding(5)

                            Text(item.name)
                                .font(.custom("AvenirNext-DemiBold", size: 15))
                                .foregroundStyle(Color.primaryGreen)
                                .multilineTextAlignment(.leading)

                            Spacer()

                            Text(item.balance)
                                .font(.custom("AvenirNext-DemiBold", size: 15))
                                .foregroundStyle(.primaryText)
                                .multilineTextAlignment(.leading)

                        })
                    }
                )


            }
            .navigationTitle("")
            .listStyle(.insetGrouped)
            .listRowSpacing(14)
            .listRowSeparator(.hidden)
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 10))
            .environment(\.defaultMinListRowHeight, 40)



        })
        .onAppear(perform: {
            viewModel.fetchBalances()
        })
    }
}

#Preview {
    AccountBalancesView()
}
