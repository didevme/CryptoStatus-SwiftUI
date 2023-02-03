//
//  ContentView.swift
//  CryptoApp-SwiftUI
//
//  Created by Dimitar Ivanov on 3.02.23.
//

import SwiftUI
import Alamofire

struct HomeView: View {
    @StateObject var homeViewModel = HomeViewModel()
    @StateObject var progress = UserProgress()
    //    @ObservedObject var localData = LocalDataManager()
    
    var body: some View {
        NavigationStack {
            ZStack {
                RadialGradient(gradient: Gradient(colors: [Color("bg"), Color("bg2")]), center: .center, startRadius: 2, endRadius: 650)
                    .ignoresSafeArea(.all)
                ScrollView(showsIndicators: false) {
                    // top movers view
                    TopMoversView(viewModel: homeViewModel)
                        .padding(.vertical)
                    Divider()
                        .padding()
                    // all coins view
                    AllCoinsView(viewModel: homeViewModel)
                }.refreshable {
                        homeViewModel.performRequest()
                }
            }.navigationTitle("Live Prices")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

class UserProgress: ObservableObject {
    @Published var score = 1
    init() {
        print("test")
        updateScore()
    }
    func updateScore() {
        print("update")
        self.score += 2
    }
}

