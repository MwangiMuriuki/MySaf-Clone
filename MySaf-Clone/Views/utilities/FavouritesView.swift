//
//  FavouritesView.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 22/03/2024.
//

import SwiftUI

struct FavouritesView: View {
    @StateObject var viewmodel = FavouritesViewModel()

    var body: some View {
        NavigationStack{
            ZStack(content: {
                Color.black.opacity(0.7)
                    .ignoresSafeArea(.all, edges: .top)

                VStack(content: {


                    HStack(content: {
                        Spacer()

                        Text("Edit Favourites")
                            .font(.custom("AvenirNext-DemiBold", size: 13))
                            .foregroundStyle(Color.white)

                        NavigationLink {
                            EditFavouritesView()
                                .navigationTitle("Edit Favourites")
                        } label: {
                            Circle()
                                .fill(.white)
                                .frame(width: 40, height: 40)
                                .overlay(
                                    Image(systemName: "pencil")
                                        .resizable()
                                        .frame(width: 18, height: 18)
                                        .foregroundStyle(.primaryRed)
                                )
                        }

                    })
                    .padding(.top, 60)
                    .padding(.trailing, 10)

                    Spacer()

                    // MARK: - List Items
                    VStack(alignment: .leading, content: {
                        let favourites = viewmodel.favouritesListData
                        let savedFavourites = favourites.all { item in
                            item.is_shortcut == true
                        }

                        ForEach(savedFavourites.reversed(), id:\.self) { item in
                            let pageType: FavouritesPageType = FavouritesPageType(rawValue: item.type)!
                            NavigationLink {
                                favouritesPageNavigation(pageType: pageType, pageTitle: item.name)
                            } label: {
                                FavouritesSingleListItemView(model: item)
                            }

                        }
                    })
                    .padding(.bottom, 30)

                })

            })
            .zIndex(1)
            .onAppear(perform: {
                viewmodel.fetchFavouritesListings()
            })
        }

    }
}

@ViewBuilder
/// Function to choose the destination by checking against the Page type
/// - Parameter pageType: AccountMenuPageType
/// - Returns: View
func favouritesPageNavigation(pageType: FavouritesPageType, pageTitle: String) -> some View {
    switch pageType {

    case .airtime_top_up:
        AirtimeTopupView().navigationTitle(pageTitle)
    case .bill_manager:
        BillManagerView().navigationTitle(pageTitle)
    case .buy_airtime:
        BuyAirtimeView().navigationTitle(pageTitle)
    case .data_calls_airtime:
        DataCallsSMSView().navigationTitle(pageTitle)
    case .fuliza_mpesa:
        FulizaMpesaView().navigationTitle(pageTitle)
    case .lipa_na_mpesa:
        LipaNaMpesaView().navigationTitle(pageTitle)
    case .loans_savings:
        LoansAndSavingsView().navigationTitle(pageTitle)
    case .mpesa_statements:
        MpesaStatementView().navigationTitle(pageTitle)
    case .scan_qr:
        ScanQRView().navigationTitle(pageTitle)
    case .send_money:
        SendMoneyView().navigationTitle(pageTitle)
    case .withdraw_cash:
        WithdrawCashView().navigationTitle(pageTitle)
    }


}

#Preview {
    FavouritesView()
}
