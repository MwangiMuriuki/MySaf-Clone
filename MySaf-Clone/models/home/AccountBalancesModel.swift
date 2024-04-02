//
//  AccountBalancesModel.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 27/03/2024.
//

import Foundation


// MARK: - AccountBalances
struct AccountBalancesModel: Codable, Identifiable {
    let id: Int
    let name, icon, balance, expiry: String
    let altLabel, altBalance: String
    let hasSecondaryAction: Bool
    let primaryAction, secondaryAction: ActionData
}

// MARK: - AryAction
struct ActionData: Codable {
    let label, action: String
}
