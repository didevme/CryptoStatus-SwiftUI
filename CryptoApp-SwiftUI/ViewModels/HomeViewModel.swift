//
//  HomeViewModel.swift
//  CryptoApp-SwiftUI
//
//  Created by Dimitar Ivanov on 3.02.23.
//

import SwiftUI
import Alamofire
import RealmSwift

class HomeViewModel: ObservableObject {
    @Published var coins = [Coin]()
    @Published var topCoins = [Coin]()
    let realm = try! Realm()
    
    init() {
        for obj in realm.objects(Coin.self) {
            self.coins.append(obj)
        }
        performRequest()
    }
    
    let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h"
    
    func performRequest() {
        AF.request(self.urlString)
            .responseDecodable(of: [Coin].self) {
                (response: DataResponse<[Coin], AFError>) in
                if let statusCode = response.response?.statusCode, !(200...299).contains(statusCode) {
                    print("Weather Error with status code: \(statusCode)")
                    return
                } else if let error = response.error {
                    print(error)
                    return
                } else {
                    if let safeData = response.value {
                        self.updateCoinData(coinData: safeData)
                    }
                }
            }
    }
    
    func updateCoinData(coinData: [Coin]) {
        DispatchQueue.main.async {
            self.coins = coinData
            self.configureTopMovingCoins()
            self.realm.beginWrite()
            self.realm.add(coinData, update: .all)
            try? self.realm.commitWrite()
        }
    }
    
    func configureTopMovingCoins() {
        let topMovers = coins.sorted(by: {$0.priceChangePercentage24H > $1.priceChangePercentage24H})
        self.topCoins = Array(topMovers.prefix(10))
    }
}
