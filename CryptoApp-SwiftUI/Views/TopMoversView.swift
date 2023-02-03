//
//  TopMoversView.swift
//  CryptoApp-SwiftUI
//
//  Created by Dimitar Ivanov on 3.02.23.
//

import SwiftUI

struct TopMoversView: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        VStack(alignment: .leading) {
            Text("Top 10 Coins")
                .font(.headline)
                .padding(.leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(viewModel.topCoins) { coin in
                        NavigationLink(destination: CoinView(coin: coin)) {
                            TopMoversItemView(coin: coin)
                        }
                        .navigationBarTitleDisplayMode(.large)
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 4)
            }
        }
    }
}

struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversView(viewModel: HomeViewModel())
    }
}
