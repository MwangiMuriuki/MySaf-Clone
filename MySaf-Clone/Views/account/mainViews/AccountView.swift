//
//  AccountView.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 22/03/2024.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = UserAccountViewModel()

    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack(spacing: 20, content: {

                    // MARK: - Verify Sim Details
                    RoundedRectangle(cornerRadius: 8)
                        .frame(height: 68)
                        .foregroundStyle(.cardBG)
                        .shadow(radius: 2)
                        .overlay(
                            HStack(alignment: .center){
                                VStack(alignment: .leading, content: {
                                    Text("SIM Details")
                                        .font(.custom("AvenirNext-DemiBold", size: 16))
                                        .foregroundStyle(.primaryText)

                                    Text("View and verify your sim details")
                                        .font(.custom("AvenirNext", size: 14))
                                        .foregroundStyle(.primaryGreen)
                                })

                                Spacer(minLength: 0)

                                Image("shield")
                                    .resizable()
                                    .frame(width: 48, height: 48)

                            }
                                .padding(8)
                        )
                        .padding(.top, 15)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)


                    // MARK: - User Details Section
                    VStack(alignment: .center) {
                        HStack(content: {
                            Text("EM")
                                .font(.custom("AvenirNext-DemiBold", size: 18))
                                .padding()
                                .background(.primaryGreen)
                                .foregroundStyle(.white)
                                .clipShape(Circle())
                                .frame(width: 64, height: 64)

                            Text("Ernest Muriuki")
                                .font(.custom("AvenirNext-Bold", size: 16))
                                .foregroundStyle(.secondaryText)

                            Spacer(minLength: 0)
                        })
                        .padding(5)

                        Divider()


                        //MARK: - Phone Number Section
                        HStack(alignment: .center, content: {
                            VStack(alignment: .center, spacing: 8,content: {
                                Text("Phone No.")
                                    .font(.custom("AvenirNext", size: 14))
                                    .foregroundStyle(.secondaryText)

                                Text("0712345678")
                                    .font(.custom("AvenirNext-Bold", size: 14))
                                    .foregroundStyle(.secondaryText)
                            })
                            .frame(minWidth: 0, maxWidth: .infinity)


                            // MARK: - Custom Divider
                            Rectangle()
                                .frame(width: 2, alignment: .center)
                                .foregroundStyle(.separator)
                                .padding(.top, 4)
                                .padding(.bottom, 8)
                                .padding(.leading, 5)
                                .padding(.trailing, 5)

                            //MARK: - Status Section
                            VStack(alignment: .center, spacing: 8,content: {
                                Text("Status")
                                    .font(.custom("AvenirNext", size: 14))
                                    .foregroundStyle(.secondaryText)

                                Text("Active")
                                    .font(.custom("AvenirNext-Bold", size: 14))
                                    .foregroundStyle(.secondaryText)
                            })
                            .frame(minWidth: 0, maxWidth: .infinity)

                            // MARK: - Custom Divider
                            Rectangle()
                                .frame(width: 2, alignment: .center)
                                .foregroundStyle(.separator)
                                .padding(.top, 4)
                                .padding(.bottom, 8)
                                .padding(.leading, 5)
                                .padding(.trailing, 5)

                            //MARK: - Tariff Section
                            VStack(alignment: .center, spacing: 8,content: {
                                Text("Tariff")
                                    .font(.custom("AvenirNext", size: 14))
                                    .foregroundStyle(.secondaryText)

                                Text("Prepaid")
                                    .font(.custom("AvenirNext-Bold", size: 14))
                                    .foregroundStyle(.secondaryText)
                            })
                            .frame(minWidth: 0, maxWidth: .infinity)


                        })
                        .padding(.top, 5)
                        .padding(.leading, 8)
                        .padding(.trailing, 8)
                        .padding(.bottom, 8)
                    }
                    .background(.cardBG)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 5))
                    .shadow(radius: 4)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)


                    // MARK: - Quick Account Actions Section
                    VStack(alignment: .center) {
                        Text("Quick Account Actions")
                            .font(.custom("AvenirNext-DemiBold", size: 16))
                            .foregroundStyle(.secondaryText)
                            .padding(10)

                        Divider()


                        //MARK: - PUK
                        HStack(alignment: .center, content: {
                            //MARK: - PUK
                            NavigationLink {
                                GetPUKView()
                                    .navigationTitle("PUK")
                            } label: {
                                VStack(alignment: .center, spacing: 8,content: {
                                    Image("simcard")
                                        .resizable()
                                        .frame(width: 40, height: 40)

                                    Text("PUK")
                                        .font(.custom("AvenirNext-Bold", size: 14))
                                        .foregroundStyle(.secondaryText)
                                })
                                .frame(minWidth: 0, maxWidth: .infinity)
                            }


                            //MARK: - Sambaza
                            NavigationLink {
                                SambazaView()
                                    .navigationTitle("Sambaza")
                            } label: {

                                VStack(alignment: .center, spacing: 8,content: {
                                    Image("airtime")
                                        .resizable()
                                        .frame(width: 40, height: 40)

                                    Text("Sambaza")
                                        .font(.custom("AvenirNext-Bold", size: 14))
                                        .foregroundStyle(.secondaryText)
                                })
                                .frame(minWidth: 0, maxWidth: .infinity)
                            }

                            //MARK: - Report Fraud
                            NavigationLink {
                                ReportFraudView()
                                    .navigationTitle("Report Fraud")
                            } label: {
                                VStack(alignment: .center, spacing: 8,content: {
                                    Image("fraud")
                                        .resizable()
                                        .frame(width: 40, height: 40)

                                    Text("Report Fraud")
                                        .font(.custom("AvenirNext-Bold", size: 14))
                                        .foregroundStyle(.secondaryText)
                                })
                                .frame(minWidth: 0, maxWidth: .infinity)
                            }
                        })
                        .padding(.top, 5)
                        .padding(.leading, 8)
                        .padding(.trailing, 8)
                        .padding(.bottom, 8)

                    }
                    .background(.cardBG)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .shadow(radius: 4)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)


                    // MARK: - List Section
                    // Use ForEach instead of a List since it is a child of a ScrollView
                    ForEach(viewModel.menuListItems, id: \.self) { item in
                        let pageType: AccountMenuPageType = AccountMenuPageType(rawValue: item.type)!
                        NavigationLink {
                            userAccountPageNavigation(pageType: pageType, pageTitle: item.name)
                        } label: {
                            AccountListItemSingleView(model: item)
                        }
                    }

                    Spacer()

                })
            }
            .navigationTitle("Account")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear(perform: {
            viewModel.fetchAccountMenuListItems()
        })
    }
}

#Preview {
    AccountView()
}

@ViewBuilder
/// Function to choose the destination by checking against the Page type
/// - Parameter pageType: AccountMenuPageType
/// - Returns: View
func userAccountPageNavigation(pageType: AccountMenuPageType, pageTitle: String) -> some View {
    switch pageType {
    case .my_usage:
        MyUsageView().navigationTitle(pageTitle)
    case .my_subscriptions:
        MySubscriptionsView().navigationTitle(pageTitle)
    case .request_esim:
        RequestESimView().navigationTitle(pageTitle)
    case .sim_management:
        SimManagementView().navigationTitle(pageTitle)
    case .app_settings:
        AppSettingsView().navigationTitle(pageTitle)
    case .rate_your_experience:
        RateAppView().navigationTitle(pageTitle)
    case .about_mysaf:
        AboutAppView().navigationTitle(pageTitle)
    }


}
