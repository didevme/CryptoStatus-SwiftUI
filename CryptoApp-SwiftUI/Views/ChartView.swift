//
//  ChartView.swift
//  CryptoApp-SwiftUI
//
//  Created by Dimitar Ivanov on 10.02.23.
//

import Charts
import SwiftUI

struct ChartView: UIViewRepresentable {
    let coin: [Double]
    let param: String
    func makeUIView(context: Context) -> Charts.LineChartView {
        return LineChartView()
    }
    
    func updateUIView(_ uiView: Charts.LineChartView, context: Context) {
        let entries = returnChartData(coin: coin)
        let dataSet = setData(tempData: entries, param: param)
        uiView.data = LineChartData(dataSet: dataSet)
        chartViewStyle(of: uiView, with: "€")
    }
    
    
    
    func returnChartData(coin: [Double]) -> [ChartDataEntry] {
        let history = coin
        var values: [ChartDataEntry] = []
        var day: ChartDataEntry
//        var index = 0.0
        var dateHours = 0.0
        for data in history {
            day = ChartDataEntry(x: dateHours, y: data)
            values.append(day)
            dateHours += 1
        }
        return values
    }
    
    func chartViewStyle(of chartView: LineChartView, with symbol: String) {
        let valFormatter = NumberFormatter()
        valFormatter.numberStyle = .currency
        valFormatter.maximumFractionDigits = 6
        valFormatter.currencySymbol = symbol
        chartView.rightAxis.enabled = false
        chartView.dragEnabled = false
        chartView.scaleYEnabled = false
        chartView.scaleXEnabled = false
        let yAxis = chartView.leftAxis
        let xAxis = chartView.xAxis
        yAxis.labelFont = .boldSystemFont(ofSize: 12)
        yAxis.setLabelCount(4, force: false)
        yAxis.labelPosition = .insideChart
        yAxis.granularity = 1
        xAxis.granularity = 1
        yAxis.valueFormatter = DefaultAxisValueFormatter(formatter: valFormatter)
        xAxis.valueFormatter = ChartXAxisFormatter()
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .boldSystemFont(ofSize: 12)
        xAxis.avoidFirstLastClippingEnabled = true
        xAxis.setLabelCount(7, force: true)
        chartView.animate(xAxisDuration: 2.5)
        
    }
    
    func setData(tempData: [ChartDataEntry], param: String) -> LineChartDataSet {
        
        let set1 = LineChartDataSet(entries: tempData, label: param)
        set1.drawCirclesEnabled = false
        set1.mode = .cubicBezier
        set1.lineWidth = 3
        set1.drawFilledEnabled = true
//        set1.fillColor = .orange
//        set1.setColor(.orange)
        set1.fillColor = coin.first ?? 0.0 > coin.last ?? 0.0 ? .red : .green
        set1.setColor(coin.first ?? 0.0 > coin.last ?? 0.0 ? .red : .green)
        set1.setDrawHighlightIndicators(false)
        let data = LineChartData(dataSet: set1)
        data.setDrawValues(false)
        return set1
    }
    
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(coin: [1.1, 1.2, 1.3], param: "Temperature")
    }
}

class ChartXAxisFormatter: IndexAxisValueFormatter {
    override func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let startDate = Calendar.current.date(byAdding: .hour, value: -163, to: Date()) ?? Date()
        let earlyDate = Calendar.current.date(byAdding: .hour, value: Int(value), to: startDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM"
        
        return dateFormatter.string(from: earlyDate ?? Date())
    }
}


