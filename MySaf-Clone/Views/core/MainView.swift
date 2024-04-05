//
//  ContentView.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 22/03/2024.
//

import SwiftUI

struct MainView: View {
    @State private var selection: Int = 0
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
               

            MpesaView()
                .tabItem {
                    Image(systemName: "paperplane")
                    Text("M-PESA")
                }
                .tag(1)
                .navigationTitle("M-PESA")


            FavouritesView()
                .tabItem {
                    Image("saf-logo")
                }
                .tag(2)


            DiscoverView()
                .tabItem {
                    Image(systemName: "gift")
                    Text("Discover")
                }
                .tag(3)

            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
                .tag(4)
        }
        .accentColor(.primaryGreen)
        .background(Color(.lightGrey))
    }
}

#Preview {
    MainView()
}
