//
//  HomePageType.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 23/03/2024.
//

import Foundation

/// Enumerator describing the different page types fo the Home Page menu options.
/// Each Page Type is used to navigate to the required inner page
enum HomePageType: String, CaseIterable {
    case ask_zuri = "ask_zuri"
    case send_money = "send_money"
    case data_calls_airtime = "data_calls_airtime"
    case lipa_na_mpesa = "lipa_na_mpesa"
    case my_usage = "my_usage"
    case home_internet = "home_internet"
    case tunukiwa_offers = "tunukiwa_offers"
    case airtime_top_up = "airtime_top_up"
    case bonga = "bonga"
    case s_hook_bundles = "s_hook_bundles"
}
