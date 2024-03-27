//
//  HomeView.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 22/03/2024.
//

import SwiftUI

struct HomeView: View {

    @StateObject var viewModel = HomeViewViewModel()

    let columns: [GridItem] = Array(repeating: .init(.adaptive(minimum: (UIScreen.main.bounds.width / 2) - 5, maximum: 197)), count: 2)
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, content: {
                // MARK: - Header Section
                HomeHeaderView()

                ScrollView(.vertical) {
                    // MARK: - Status Section
                    UpdatesView()

                    // MARK: - Carousel Section
                    CarouselGridView()
                        .environmentObject(viewModel)

                    // MARK: - Main Cards
                    LazyVGrid(columns: columns, content: {
                        ForEach(viewModel.mainCardItems, id: \.self){ item in
                            let pageType: PageType = PageType(rawValue: item.type)!
                            NavigationLink {
                                chooseDestination(pageType: pageType)
                            } label: {
                                HomeCardItemsView(model: item)
                            }
                        }
                    })
                    .padding(.top, 0)
                    .padding(.leading, 8)
                    .padding(.trailing, 8)
                    .padding(.bottom, 8)

                    // MARK: - Hot Deals Section
                    VStack(content: {
                        Text("HOT DEALS")
                            .font(.custom("AvenirNext-Medium", size: 16))
                            .foregroundStyle(Color.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        ScrollView(.horizontal) {
                            LazyHStack(alignment: .center, spacing: 10, content: {
                                ForEach(viewModel.hotDealsData) { item in
                                    HotDealsView(model: item)
                                }
                            })
                        }
                        .springLoadingBehavior(.disabled)

                    })
                    .padding(.leading, 8)
                    .padding(.trailing, 8)


                    // MARK: - For You Section
                    VStack(content: {
                        Text("FOR YOU")
                            .font(.custom("AvenirNext-Medium", size: 16))
                            .foregroundStyle(Color.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        TabView{
                            ForEach(carouselPics, id: \.self) { item in
                                Image(item.name)
                                    .resizable()
                                    .scaledToFill()
                            }
                        }
                        .tabViewStyle(.page)
                        .indexViewStyle(.page(backgroundDisplayMode: .automatic))
                        .frame(height: 150)
                        .shadow(radius: 2)
                        
                    })
                    .padding(.leading, 8)
                    .padding(.trailing, 8)
                    .padding(.bottom, 20)


                }
                .padding(.top, 30)

            })
            .onAppear(perform: {
                viewModel.fetchHomeCardsListings()
            })
        }

    }
}

@ViewBuilder
/// Function to choose the destination by checking against the Page type
/// - Parameter pageType: PageType
/// - Returns: View
private func chooseDestination(pageType: PageType) -> some View {
    switch pageType {
    case .ask_zuri:
        ChatbotView()
    case .send_money:
        SendMoneyView()
    case .data_calls_airtime:
        DataCallsSMSView()
    case .lipa_na_mpesa:
        LipaNaMpesaView()
    case .my_usage:
        MyUsageView()
    case .home_internet:
        HomeInternetView()
    case .tunukiwa_offers:
        TunukiwaOffersView()
    case .airtime_top_up:
        AirtimeTopupView()
    case .bonga:
        BongaView()
    case .s_hook_bundles:
        SHookBundlesView()
    }

}

#Preview {
    HomeView()
}

