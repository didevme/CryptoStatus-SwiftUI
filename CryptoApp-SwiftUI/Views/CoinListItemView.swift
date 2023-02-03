//
//  CoinListItemView.swift
//  CryptoApp-SwiftUI
//
//  Created by Dimitar Ivanov on 10.02.23.
//

import SwiftUI

struct CoinListItemView: View {
    let name: String
    let icon: String
    let parameter: String
    var body: some View {
        HStack {
            Image(systemName: icon)
//                .resizable()
                .scaledToFit()
//                .frame(width: 32, height: 32)
            Text(name)
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.leading, 4)
            
            Spacer()
            Text(parameter)
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.leading, 4)
        }
        .padding()
        .background(.ultraThinMaterial, in:
                        RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}

struct CoinListItemView_Previews: PreviewProvider {
    static var previews: some View {
        CoinListItemView(name: "Bitcoin", icon: "sun.max", parameter: "22.6%")
    }
}
