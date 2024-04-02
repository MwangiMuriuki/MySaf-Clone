//
//  MpesaView.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 22/03/2024.
//

import SwiftUI

struct MpesaView: View {
    @StateObject var viewModel = MpesaMainViewModel()

    let columns: [GridItem] = Array(repeating: .init(.adaptive(minimum: (UIScreen.main.bounds.width / 2) - 10, maximum: 197)), count: 3)

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(spacing: 20, content: {
                    // MARK: - M-Pesa Balance Button
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
                            .frame(width: UIScreen.main.bounds.width - 20, height: 46)
                            .background(Color.cardBG)
                            .clipShape(Capsule())
                            .shadow(radius: 4)
                    }


                    // MARK: - Options Grid
                    LazyVGrid(columns: columns, content: {
                        ForEach(viewModel.mpesaCardItems, id: \.self){ item in
                            let pageType: MpesaCardsPageType = MpesaCardsPageType(rawValue: item.type)!
                            NavigationLink {
                                mpesaPageNavigation(pageType: pageType, pageTitle: item.name)
                            } label: {
                                MpesaBalancesSingleCardView(model: item)
                            }
                        }
                    })
                    .padding(.leading, 8)
                    .padding(.trailing, 8)


                    // MARK: - M-Pesa Statement Button
                    NavigationLink {
                        MpesaStatementView()
                            .toolbar(content: {
                                ToolbarItem(placement: .principal) {
                                    Text("M-PESA Statements")
                                        .font(.custom("AvenirNext-DemiBold", size: 18))
                                        .foregroundStyle(Color.white)
                                }
                            })
                            .toolbarBackground(Color.headerBG, for: .navigationBar)
                            .toolbarBackground(.visible, for: .navigationBar)
                            .toolbarColorScheme(.dark, for: .navigationBar)
                    } label: {
                        Text("M-PESA Statements")
                            .font(.custom("AvenirNext-DemiBold", size: 16))
                            .foregroundStyle(Color.primaryGreen)
                            .frame(width: UIScreen.main.bounds.width - 20, height: 46)
                            .background(Color.cardBG)
                            .clipShape(Capsule())
                            .shadow(radius: 4)
                    }

                    // MARK: - Scan To Pay Button
                    NavigationLink {
                        MpesaStatementView()
                            .toolbar(content: {
                                ToolbarItem(placement: .principal) {
                                    Text("M-PESA Statements")
                                        .font(.custom("AvenirNext-DemiBold", size: 18))
                                        .foregroundStyle(Color.white)
                                }
                            })
                            .toolbarBackground(Color.headerBG, for: .navigationBar)
                            .toolbarBackground(.visible, for: .navigationBar)
                            .toolbarColorScheme(.dark, for: .navigationBar)
                    } label: {
                        Text("Scan to Pay")
                            .font(.custom("AvenirNext-DemiBold", size: 16))
                            .foregroundStyle(Color.black)
                            .frame(width: UIScreen.main.bounds.width - 20, height: 46)
                            .background(Color.primaryRed)
                            .clipShape(Capsule())
                            .shadow(radius: 4)
                    }

                    Spacer()
                })
            }
            .navigationTitle("M-PESA")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                viewModel.fetchMpesaCardsListings()
            })

        }

    }
}

@ViewBuilder
/// Function to choose the destination by checking against the Page type
/// - Parameter pageType: PageType
/// - Returns: View
func mpesaPageNavigation(pageType: MpesaCardsPageType, pageTitle: String) -> some View {
    switch pageType {
    case .send_money:
        SendMoneyView().navigationTitle(pageTitle)
    case .withdraw_cash:
        WithdrawCashView().navigationTitle(pageTitle)
    case .buy_airtime:
        BuyAirtimeView().navigationTitle(pageTitle)
    case .lipa_na_mpesa:
        LipaNaMpesaView().navigationTitle(pageTitle)
    case .bill_manager:
        BillManagerView().navigationTitle(pageTitle)
    case .loans_savings:
        LoansAndSavingsView().navigationTitle(pageTitle)
    case .fuliza_mpesa:
        FulizaMpesaView().navigationTitle(pageTitle)
    case .mpesa_global:
        MpesaGlobalView().navigationTitle(pageTitle)
    case .account:
        MpesaAccountView().navigationTitle(pageTitle)
    }

}

#Preview {
    MpesaView()
}
