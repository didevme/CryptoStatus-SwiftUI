//
//  CoinView.swift
//  CryptoApp-SwiftUI
//
//  Created by Dimitar Ivanov on 10.02.23.
//

import SwiftUI
import Kingfisher

struct CoinView: View {
    let coin: Coin
    var body: some View {
        ScrollView {
            VStack {
               
                HStack {
                    CoinCardItemView(name: "Current price", icon: "eurosign.circle", parameter: coin.currentPrice.toCurrency(), percent: coin.priceChangePercentage24H)
                    CoinCardItemView(name: "Market cap", icon: "chart.pie", parameter: coin.marketCap?.toCurrencyInt() ?? "0 EUR", percent: coin.marketCapChangePercentage24H ?? 0)
//                    CoinCardItemView(name: "24h Price Change", icon: "clock", parameter: coin.priceChange24H.toCurrency())
                }
                ChartView(coin: coin.sparklineIn7D?.price ?? [], param: "Price over last 7 days")
                    .frame(height: 200)
                CoinListItemView(name: "24h High price", icon: "arrow.up.right", parameter: coin.high24H?.toCurrency() ?? "0.00 EUR")
                CoinListItemView(name: "24h Low price", icon: "arrow.down.left", parameter: coin.low24H?.toCurrency() ?? "0.00 EUR")
                CoinListItemView(name: "24h Trading Vol", icon: "arrow.up.arrow.down", parameter: coin.totalVolume?.toCurrency() ?? "0.00 EUR")
                CoinListItemView(name: "Circulating Supply", icon: "arrow.clockwise", parameter: String(format: "%.0f", (coin.circulatingSupply ?? 0)) + " " + coin.symbol.uppercased())
                CoinListItemView(name: "Total Supply", icon: "square.2.layers.3d.top.filled", parameter: String(format: "%.0f", (coin.totalSupply ?? 0)) + " " + coin.symbol.uppercased())
                CoinListItemView(name: "Max Supply", icon: "square.3.layers.3d.top.filled", parameter: String(format: "%.0f", (coin.maxSupply ?? 0)) + " " + coin.symbol.uppercased())
                
            }
            .padding()
        }
        .navigationTitle(coin.name)
        .overlay(
            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
//                .clipShape(Circle())
                .padding(.trailing, 20)
                .offset(x: 0, y:  -50),
            alignment: .topTrailing
        )
    }
}

struct CoinView_Previews: PreviewProvider {
    static var previews: some View {
        CoinView(coin: Coin())
    }
}
