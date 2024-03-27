//
//  HomeViewViewModel.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 23/03/2024.
//

import Foundation
import SwiftUI

class HomeViewViewModel: ObservableObject{
    private let dataManager = DataManager()
    @Published var mainCardItems = [CardModel]()
    @Published var carouselCardItems = [CardModel]()
    @Published var hotDealsData = [HotDealsModel]()

    func fetchHomeCardsListings(){
        dataManager.fetchMenuData { [weak self] fetchedData in
            self?.mainCardItems = fetchedData.mainCardOptions
            self?.carouselCardItems = fetchedData.carouselCardOptions
            self?.hotDealsData = fetchedData.hotDeals

            print("FilteredItems: \(self?.mainCardItems.count)")

        }
    }
}
