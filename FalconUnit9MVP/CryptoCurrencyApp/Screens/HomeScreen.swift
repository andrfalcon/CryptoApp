import SwiftUI
import iLineChart
import iColor

// this struct displays the default home screen with the cryptocurrency graph, their prices, and list of cryptocurrencies
struct HomeScreen: View {
    
    let id = UUID()
    @State var data: Response? // 5 year data
    @State var selectedCrypto = 0
    @State var displayErrorMessage: Bool = true
    var fiveYearsAgo: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return "\(dateFormatter.string(from: Date.init(timeInterval: -157680000, since: Date())))" // -157680000 is the number of seconds in 5 years
    }
    
    var body: some View {
        VStack {
            if let dataResponse = data {
                VStack {
                    ForEach(0..<dataResponse.count) { i in
                        if selectedCrypto == i {
                            CryptoCard(ticker: dataResponse[selectedCrypto].currency, prices: dataResponse[selectedCrypto].prices)
                        }
                    }
                    
                    TimeAxis()
                    
                    Divider()
                        .padding(.bottom, 3)
                    
                    VStack {
                        HStack {
                            ForEach(0..<dataResponse.count - 10) { crypto in // arranges the cryptocurrencies in groups of 3 and displays them
                                Button {
                                    selectedCrypto = crypto
                                } label: {
                                    ZStack {
                                        HStack {
                                            Image(dataResponse[crypto].currency)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 20)
                                            Text(dataResponse[crypto].currency)
                                                .font(.custom("Avenir", size: 10))
                                                .foregroundColor(Color.darkOceanBlue)
                                                .fontWeight(.bold)
                                        }
                                        .padding(7)
                                    }
                                }
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(color: .gray, radius: 3)
                            }
                        }
                        HStack {
                            ForEach(5..<dataResponse.count - 5) { crypto in
                                Button {
                                    selectedCrypto = crypto
                                } label: {
                                    ZStack {
                                        HStack {
                                            Image(dataResponse[crypto].currency)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 20)
                                            Text(dataResponse[crypto].currency)
                                                .font(.custom("Avenir", size: 10))
                                                .foregroundColor(Color.darkOceanBlue)
                                                .fontWeight(.bold)
                                        }
                                        .padding(7)
                                    }
                                }
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(color: .gray, radius: 3)
                            }
                        }
                        HStack {
                            ForEach(10..<dataResponse.count) { crypto in
                                Button {
                                    selectedCrypto = crypto
                                } label: {
                                    ZStack {
                                        HStack {
                                            Image(dataResponse[crypto].currency)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 20)
                                            Text(dataResponse[crypto].currency)
                                                .font(.custom("Avenir", size: 10))
                                                .foregroundColor(Color.darkOceanBlue)
                                                .fontWeight(.bold)
                                        }
                                        .padding(7)
                                    }
                                }
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(color: .gray, radius: 3)
                            }
                        }
                    }
                    .padding(.bottom, 12)
                }
                .onAppear {
                    displayErrorMessage = false // this line will only run if the view appears, meaning the data is present, so no need for an error message
                }
            }
            if displayErrorMessage {
                ErrorView()
            }
        }
        .onAppear {
            let urlString = "https://api.nomics.com/v1/currencies/sparkline?key=93a294b2c4e7a18cd848a60fce6734b9ae334119&ids=BTC,ETH,USDT,ADA,BNB,DOGE,XRP,HEX,DOT,USDC,UNI,ICP,BCH,LINK,LTC&start=\(self.fiveYearsAgo)T00%3A00%3A00Z"
            getData(from: urlString) { data in
                self.data = data
            }
        }
    }
}


