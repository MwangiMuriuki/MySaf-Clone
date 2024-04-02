//
//  AccountBalancesViewModel.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 27/03/2024.
//

import Foundation

class AccountBalancesViewModel: ObservableObject {
    private let dataManager = DataManager()
    @Published var accountBalances = [AccountBalancesModel]()


    func fetchBalances(){
        dataManager.fetchAccountBalances(completion: { [weak self] fetchedData in
            self?.accountBalances = fetchedData

            print("FilteredItems: \(self?.accountBalances.count)")
        })
    }


}
