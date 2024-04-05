//
//  FavouritesViewModel.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 05/04/2024.
//

import Foundation

class FavouritesViewModel: ObservableObject{
    private let dataManager = DataManager()
    @Published var favouritesListData = [FavouritesModelClass]()
    @Published var savedFavourites: [FavouritesModelClass] = []
    @Published var otherFavourites: [FavouritesModelClass] = []



    func fetchFavouritesListings(){
        dataManager.fetchFavouritesData { [weak self] fetchedData in
            self?.favouritesListData = fetchedData
            print("FavouritesItems: \(String(describing: self?.favouritesListData.count))")

            var savedItems = self?.favouritesListData.all { item in
                item.is_shortcut == true
            }
            self?.savedFavourites = savedItems ?? []

            var otherItems = self?.favouritesListData.all { item in
                item.is_shortcut == false
            }
            self?.otherFavourites = otherItems ?? []
        }
    }

    func filterSavedShortcuts() -> [FavouritesModelClass]{
        var filteredList = favouritesListData.all { item in
            item.is_shortcut == true
        }
        savedFavourites = filteredList

        return savedFavourites
    }
}
