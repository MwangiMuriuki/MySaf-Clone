//
//  FavouritesPageType.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 05/04/2024.
//

import Foundation

/// Enumerator describing the different page types fo the Favourites Page  options.
/// Each Page Type is used to navigate to the required inner page
enum FavouritesPageType: String, CaseIterable{
    case airtime_top_up = "airtime_top_up"
    case bill_manager = "bill_manager"
    case buy_airtime = "buy_airtime"
    case data_calls_airtime = "data_calls_airtime"
    case fuliza_mpesa = "fuliza_mpesa"
    case lipa_na_mpesa = "lipa_na_mpesa"
    case loans_savings = "loans_savings"
    case mpesa_statements = "mpesa_statements"
    case scan_qr = "scan_qr"
    case send_money = "send_money"
    case withdraw_cash = "withdraw_cash"
}
