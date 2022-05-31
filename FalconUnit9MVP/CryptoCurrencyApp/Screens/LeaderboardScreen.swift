import SwiftUI

// This struct constitutes each cryptocurrency and its most recent price according to the api
struct SortedCryptoPrice {
    let cryptocurrency: String
    let latestPrice: Double
}

// This struct makes up the leaderboard/ranking system. It uses a ForEach loop to create instances of CryptoCard() with unique data
struct LeaderboardScreen: View {
    
    let id = UUID()
    @State var displayErrorMessage: Bool = true
    @State var data: Response?
    var displayedCryptoPrices: [SortedCryptoPrice] { // accesses the last, or most recent/accurate price for the specified currencies. Sorts them from greatests to lowest
        var latestCryptoPrices: [Double] = []
        var sortedCryptoPrices: [SortedCryptoPrice] = []
        
        if let dataResponse = data {
            for crypto in 0..<dataResponse.count {
                latestCryptoPrices.append(Double(dataResponse[crypto].prices.last ?? "0.0") ?? 0.0)
            }
            latestCryptoPrices = latestCryptoPrices.sorted().reversed()
            for crypto in 0..<latestCryptoPrices.count {
                for comparedCrypto in 0..<dataResponse.count {
                    if Double(dataResponse[comparedCrypto].prices.last ?? "0.0") == latestCryptoPrices[crypto] {
                        sortedCryptoPrices.append(SortedCryptoPrice(cryptocurrency: dataResponse[comparedCrypto].currency, latestPrice: latestCryptoPrices[crypto]))
                    }
                }
            }
        }
        return sortedCryptoPrices
    }
    var fiveYearsAgo: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return "\(dateFormatter.string(from: Date.init(timeInterval: -157680000, since: Date())))T00%3A00%3A00Z"
    }
    
    var body: some View {
        VStack {
            if let dataResponse = data {
                VStack {
                    Text("Crypto Rankings")
                        .font(.custom("Avenir", size: 32))
                        .foregroundColor(Color.darkGray)
                        .fontWeight(.regular)
                        .padding(-4)
                    List(0..<displayedCryptoPrices.count) { crypto in
                        CryptoRanking(rank: crypto + 1, logo: displayedCryptoPrices[crypto].cryptocurrency, ticker: displayedCryptoPrices[crypto].cryptocurrency, price: displayedCryptoPrices[crypto].latestPrice)
                    }
                }
                .onAppear {
                    displayErrorMessage = false
                }
            }
            if displayErrorMessage {
                ErrorView()
            }
        }
        .onAppear {
            let urlString = "https://api.nomics.com/v1/currencies/sparkline?key=93a294b2c4e7a18cd848a60fce6734b9ae334119&ids=BTC,ETH,USDT,ADA,BNB,DOGE,XRP,HEX,DOT,USDC,UNI,ICP,BCH,LINK,LTC&start=\(self.fiveYearsAgo)"
            getData(from: urlString) { data in
                self.data = data
            }
        }
    }
}


