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

    var body: some View {

        VStack(content: {
            // MARK:- Top View Actions
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

                Button(action: {}, label: {
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
                .font(.headline)
                .foregroundStyle(.white)
                .padding(.top, 8)

            Spacer(minLength: 0)

            Button(action: {}, label: {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: UIScreen.main.bounds.width - 180, height: 44)
                    .foregroundStyle(.cardBG)
                    .shadow(radius: 4)
                    .overlay(
                        Text("View my Balances")
                            .font(.custom("AvenirNext-Medium", size: 16))
                            .foregroundStyle(Color.primaryGreen)
                    )
            })
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
