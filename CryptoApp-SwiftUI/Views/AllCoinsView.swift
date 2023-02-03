//
//  AllCoinsView.swift
//  CryptoApp-SwiftUI
//
//  Created by Dimitar Ivanov on 3.02.23.
//

import SwiftUI

struct AllCoinsView: View {
    @StateObject var viewModel: HomeViewModel
    @State private var searchText = ""
    var body: some View {
//        NavigationView {
        VStack(alignment: .leading) {
            Text("All Coins")
                .font(.headline)
                .padding(.horizontal)
            TextField("Search", text: $searchText)
                .padding(.vertical, 8)
                .padding(.horizontal)
                .background(.ultraThinMaterial, in:
                                RoundedRectangle(cornerRadius: 30, style: .continuous))
                .padding(.horizontal)
                .padding(.bottom)
            HStack {
                Text("Coin")
                Spacer()
                Text("Prices")
            }
            .font(.caption)
            .foregroundColor(.gray)
            .padding(.horizontal)
            ScrollView {
                VStack {
                    //                    ForEach(viewModel.coins, id: \.id) { coin in
                    //                        CoinCell(coin: coin)
                    //                    }
                    ForEach(seachResults, id: \.id) { coin in
                        NavigationLink(destination: CoinView(coin: coin)) {
                            CoinCell(coin: coin)
                        }
                        .navigationBarTitleDisplayMode(.large)
                        .buttonStyle(PlainButtonStyle())
                    }
                }.padding()
            }
//        }
    }
//        .searchable(text: $searchText)
    }
    
    var seachResults: [Coin] {
        if searchText.isEmpty {
            return viewModel.coins
        } else {
            return viewModel.coins.filter {
                $0.name.lowercased().contains(searchText.lowercased()) || $0.symbol.lowercased().contains(searchText.lowercased())
                
            }
        }
    }
}

struct AllCoinsView_Previews: PreviewProvider {
    static var previews: some View {
        AllCoinsView(viewModel: HomeViewModel())
    }
}
