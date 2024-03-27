//
//  DataManager.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 23/03/2024.
//

import Foundation


/// All Data Calls are made from this class
final class DataManager{
    init(){}

    // MARK: - Fetch Home Cards Menu Data
    func fetchMenuData(completion: @escaping (HomeCardData) -> Void) {
            guard let url = Bundle.main.url(forResource: "homeCardsData", withExtension: "json") else {
                print("Error: Failed to find JSON file")
                return
            }

            URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error {
                    print("Error: Error fetching data: \(error)")
                    return
                }

                guard let jsonData = data else {
                    print("Error: No data found")
                    return
                }

                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(HomeCardData.self, from: jsonData)
                    completion(decodedData)
                    print("Data Fetched: ", decodedData)
                } catch {
                    print("Error: Error decoding JSON File: ", String(describing: error))
                }
            }.resume()
        }

    // MARK: - Fetch Account Balances
    func fetchAccountBalances(completion: @escaping ([AccountBalancesModel]) -> Void) {
            guard let url = Bundle.main.url(forResource: "accountBalances", withExtension: "json") else {
                print("Error: Failed to find JSON file")
                return
            }

            URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error {
                    print("Error: Error fetching data: \(error)")
                    return
                }

                guard let jsonData = data else {
                    print("Error: No data found")
                    return
                }

                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode([AccountBalancesModel].self, from: jsonData)
                    completion(decodedData)
                    print("Data Fetched: ", decodedData)
                } catch {
                    print("Error: Error decoding JSON File: ", String(describing: error))
                }
            }.resume()
        }


   
}
