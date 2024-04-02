//
//  HomeHeaderView.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 22/03/2024.
//

import SwiftUI

enum AppTheme: String, CaseIterable, Identifiable {
    case systemDefault = "System Default"
    case light = "Light Theme"
    case dark = "Dark Theme"
    var id: String { self.rawValue }
}

struct HomeHeaderView: View {
    @State private var selectedTheme: AppTheme = .systemDefault
    @State private var showSearchPage = false
    @State private var showNotificationsPage = false
    @State private var showBalancesPage = false

    var body: some View {

        VStack(content: {

            // MARK: - Top View Actions
            HStack(content: {

                Image(systemName: "moonphase.first.quarter")
                    .foregroundStyle(.white)

                Picker("App Theme", selection: $selectedTheme) {
                    ForEach(AppTheme.allCases){ value in
                        Text(value.rawValue).tag(value)
                    }
                }
                .pickerStyle(.menu)
                .foregroundStyle(.white)
                .tint(.white)

                Spacer()

                Button(action: {

                }, label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.white)
                })
                .frame(width: 40)


                Button(action: {}, label: {
                    Image(systemName: "bell.badge")
                        .foregroundStyle(.white)
                })
                .frame(width: 40)
            })
            .padding(.leading, 8)
            .padding(.trailing, 8)

            //MARK: - Greetings Text
            Text("Good Afternoon")
                .font(.system(size: 15))
                .foregroundStyle(.white)
                .padding(.top, 5)

            Text("ERNEST")
                .font(.custom("Chalkduster", size: 26))
                .foregroundStyle(.white)
    
                .padding(.bottom, 10)

            Spacer(minLength: 0)


            NavigationLink {
                AccountBalancesView()
                    .toolbar(content: {
                        ToolbarItem(placement: .principal) {
                            Text("My Account Balances")
                                .font(.custom("AvenirNext-DemiBold", size: 18))
                                .foregroundStyle(Color.white)
                        }
                    })
                    .toolbarBackground(Color.headerBG, for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
                    .toolbarColorScheme(.dark, for: .navigationBar)

//                AccountBalancesView()
//                    .navigationTitle("My Account Balances")
//                    .toolbarBackground(.headerBG, for: .navigationBar)
//                    .toolbarBackground(.visible, for: .navigationBar)
//                    .toolbarColorScheme(.dark, for: .navigationBar)

            } label: {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: UIScreen.main.bounds.width - 180, height: 44)
                    .foregroundStyle(.cardBG)
                    .shadow(radius: 4)
                    .overlay(
                        Text("View my Balances")
                            .font(.custom("AvenirNext-Medium", size: 16))
                            .foregroundStyle(Color.primaryGreen)
                    )
            }
            .padding(.bottom, -22)


        })
        .background(.headerBG)
        .frame(height: 120)

        Spacer()


    }

}

#Preview {
    HomeHeaderView()
}
