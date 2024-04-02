//
//  MpesaMainViewModel.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 02/04/2024.
//

import Foundation
import SwiftUI


class MpesaMainViewModel: ObservableObject {
    private let dataManager = DataManager()
    @Published var mpesaCardItems = [CardModel]()

    func fetchMpesaCardsListings(){
        dataManager.fetchMpesaViewData { fetchedData in
            self.mpesaCardItems = fetchedData
        }
    }

}
