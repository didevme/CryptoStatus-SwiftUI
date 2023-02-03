//
//  Double.swift
//  CryptoApp-SwiftUI
//
//  Created by Dimitar Ivanov on 4.02.23.
//

import Foundation

extension Double {
    
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.currencyCode = "EUR"
//        formatter.locale = Locale(identifier: "de-DE")
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    private var currencyIntFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.currencyCode = "EUR"
//        formatter.locale = Locale(identifier: "de-DE")
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        return formatter
    }
    
    private var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func toCurrency() -> String {
        return currencyFormatter.string(for: self) ?? "$0.00"
    }
    func toCurrencyInt() -> String {
        return currencyIntFormatter.string(for: self) ?? "$0"
    }
    
    func toPercent() -> String {
        guard let numberAsString = numberFormatter.string(for: self) else { return "" }
        return numberAsString + "%"
    }
}
