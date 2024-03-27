//
//  HomeCardData.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 23/03/2024.
//

import Foundation

struct HomeCardData: Codable, Hashable{
    let carouselCardOptions: [CardModel]
    let mainCardOptions: [CardModel]
    let hotDeals: [HotDealsModel]
}

