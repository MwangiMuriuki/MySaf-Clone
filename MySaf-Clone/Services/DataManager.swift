//
//  DataManager.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 23/03/2024.
//

import Foundation


final class DataManager{
    init(){}

    func fetchMenuData(completion: @escaping (HomeCardData) -> Void) {
            guard let url = Bundle.main.url(forResource: "homeCardsData", withExtension: "json") else {
                print("Error: Failed to find JSON file")
//                completion([])
                return
            }

            URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error {
                    print("Error: Error fetching data: \(error)")
//                    completion([])
                    return
                }

                guard let jsonData = data else {
                    print("Error: No data found")
//                    completion([])
                    return
                }

                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(HomeCardData.self, from: jsonData)
                    completion(decodedData)
                    print("Data Fetched: ", decodedData)
                } catch {
                    print("Error: Error decoding JSON File: ", String(describing: error))
//                    completion([])
                }
            }.resume()
        }
}
