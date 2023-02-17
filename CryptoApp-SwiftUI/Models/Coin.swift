//
//  Coin.swift
//  CryptoApp-SwiftUI
//
//  Created by Dimitar Ivanov on 3.02.23.
//

import Foundation
import RealmSwift


struct CoinData: Decodable {
    let id: String
    let symbol: String
    let name: String
    let image: String
    let current_price: Double
    let market_cap: Double?

    let market_cap_rank: Double?
    let fully_diluted_valuation: Double?
    let total_volume: Double?
    let high_24h: Double?
    
    let low_24h: Double?
    let price_change_24h: Double
    let price_change_percentage_24h: Double
    
    let market_cap_change_24h: Double?
    let market_cap_change_percentage_24h: Double?
    let circulating_supply: Double?
    
    let total_supply: Double?
    let max_supply: Double?
    let ath: Double?
    let ath_change_percentage: Double?
    let ath_date: String?
    let atl: Double?
    let atl_change_percentage: Double?
    let atl_date: String
    
    let last_updated: String
//        case sparklineIn7D = "sparkline_in_7d"
    let price_change_percentage_24h_in_currency: Double?
    
}

class Coin: Object, Decodable, Identifiable {
    @Persisted (primaryKey: true) var id: String
    @Persisted var symbol: String
    @Persisted var name: String
    @Persisted var image: String
    @Persisted var currentPrice: Double
    @Persisted var marketCap: Double?
    @Persisted var marketCapRank: Int
    @Persisted var fullyDilutedValuation: Double?
    @Persisted var totalVolume: Double?
    @Persisted var high24H: Double?
    @Persisted var low24H: Double?
    @Persisted var priceChange24H: Double
    @Persisted var priceChangePercentage24H: Double
    @Persisted var marketCapChange24H: Double?
    @Persisted var marketCapChangePercentage24H: Double?
    @Persisted var circulatingSupply: Double?
    @Persisted var totalSupply: Double?
    @Persisted var maxSupply: Double?
    @Persisted var ath: Double?
    @Persisted var athChangePercentage: Double?
    @Persisted var athDate: String?
    @Persisted var atl: Double?
    @Persisted var atlChangePercentage: Double?
    @Persisted var atlDate: String
    @Persisted var lastUpdated: String
    var sparklineIn7D: SparklineIn7D?
    @Persisted var priceChangePercentage24HInCurrency: Double?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case symbol = "symbol"
        case name = "name"
        case image = "image"
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24H = "high_24h"
        case low24H = "low_24h"
        case priceChange24H = "price_change_24h"
        case priceChangePercentage24H = "price_change_percentage_24h"
        case marketCapChange24H = "market_cap_change_24h"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath = "ath"
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl = "atl"
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7D = "sparkline_in_7d"
        case priceChangePercentage24HInCurrency = "price_change_percentage_24h_in_currency"
    }
}

class SparklineIn7D: Codable {
    var price: [Double]

    enum CodingKeys: String, CodingKey {
        case price = "price"
    }

    init(price: [Double]) {
        self.price = price
    }
}
