//
//  CoinCardItemView.swift
//  CryptoApp-SwiftUI
//
//  Created by Dimitar Ivanov on 10.02.23.
//

import SwiftUI

struct CoinCardItemView: View {
    let name: String
    let icon: String
    let parameter: String
    let percent: Double
    var body: some View {
        VStack() {
            Text(name)
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.vertical, 2)
            Text(parameter)
                .font(.subheadline)
                .fontWeight(.semibold)
            Text(percent.toPercent())
                .font(.title2)
                .foregroundColor(percent > 0 ? .green : .red)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.ultraThinMaterial, in:
                        RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}

struct CoinCardItemView_Previews: PreviewProvider {
    static var previews: some View {
        CoinCardItemView(name: "Market Cap", icon: "sun.max", parameter: "20.66663", percent: 6.0)
    }
}
