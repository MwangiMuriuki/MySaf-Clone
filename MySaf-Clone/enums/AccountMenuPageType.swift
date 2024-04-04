//
//  AccountMenuPageType.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 04/04/2024.
//

import Foundation

/// Enumerator describing the different page types fo the User Account Page menu options.
/// Each Page Type is used to navigate to the required inner page
enum AccountMenuPageType: String, CaseIterable{
    case my_usage = "my_usage"
    case my_subscriptions = "my_subscriptions"
    case request_esim = "request_esim"
    case sim_management = "sim_management"
    case app_settings = "app_settings"
    case rate_your_experience = "rate_your_experience"
    case about_mysaf = "about_mysaf"
}
