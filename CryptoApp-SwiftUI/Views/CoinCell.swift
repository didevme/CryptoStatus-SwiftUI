//
//  CoinCell.swift
//  CryptoApp-SwiftUI
//
//  Created by Dimitar Ivanov on 3.02.23.
//

import SwiftUI
import Kingfisher

struct CoinCell: View {
    let coin: Coin
    var body: some View {
        HStack {
            // rank
            Text("\(coin.marketCapRank)")
                .font(.caption)
                .foregroundColor(.gray)
            // image
            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
            // coin name
            VStack(alignment: .leading, spacing: 4) {
                Text(coin.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .padding(.leading, 6)
            }
            .padding(.leading, 2)
            
            Spacer()
            // coin price
            VStack(alignment: .trailing, spacing: 4) {
                Text(coin.currentPrice.toCurrency())
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.leading, 4)
                Text(coin.priceChangePercentage24H.toPercent())
                    .font(.caption)
                    .padding(.leading, 6)
                    .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
            }
            .padding(.leading, 2)
        }
        .padding()
        .background(.ultraThinMaterial, in:
                        RoundedRectangle(cornerRadius: 12, style: .continuous))
        
    }
}

struct CoinCell_Previews: PreviewProvider {
    static var previews: some View {
        CoinCell(coin: Coin())
    }
}
