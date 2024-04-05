//
//  FavouritesModelClass.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 05/04/2024.
//

import Foundation

struct FavouritesModelClass: Codable, Hashable {
    let name: String
    let icon: String
    let type: String
    let is_shortcut: Bool
}
