//
//  UserAccountViewModel.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 04/04/2024.
//

import Foundation

class UserAccountViewModel: ObservableObject{
    private let dataManager = DataManager()
    @Published var menuListItems = [CardModel]()

    func fetchAccountMenuListItems(){
        dataManager.fetchUserAccountViewData { [weak self] fetchedData in
            self?.menuListItems = fetchedData
            print("Items Fetched: \(self?.menuListItems.count)")
        }
    }
}
