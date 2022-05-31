import SwiftUI

// This struct makes up the component for the "cards" displaying each individual cryptocurrency and their ranking
struct CryptoRanking: View {
    
    @State var rank: Int // data parameters for all variables passed through in LeaderboardScreen()
    @State var logo: String
    @State var ticker: String
    @State var price: Double
    var cryptocurrency: String {
        if ticker == "BTC" {
            return "Bitcoin"
        } else if ticker == "ETH" {
            return "Ethereum"
        } else if ticker == "USDT" {
            return "Tether USD"
        } else if ticker == "ADA" {
            return "Cardano"
        } else if ticker == "BNB" {
            return "Binance Coin"
        } else if ticker == "XRP" {
            return "XRP Coin"
        } else if ticker == "DOGE" {
            return "Dogecoin"
        } else if ticker == "HEX" {
            return "HEX Coin"
        } else if ticker == "DOT" {
            return "Polkadot"
        } else if ticker == "USDC" {
            return "USDC Coin"
        } else if ticker == "UNI" {
            return "Uniswap"
        } else if ticker == "ICP" {
            return "DFINITY"
        } else if ticker == "BCH" {
            return "Bitcoin Cash"
        } else if ticker == "LINK" {
            return "Chainlink"
        } else if ticker == "LTC" {
            return "Litecoin"
        }
        return ""
    }
    
    var body: some View {
        HStack {
            Circle()
                .strokeBorder(Color.darkOceanBlue,lineWidth: 2)
                .background(Circle().foregroundColor(Color.white))
                .frame(width: 40, height: 40)
                .overlay(
                    Text("\(rank)")
                        .font(.custom("Avenir", size: 15))
                        .foregroundColor(Color.darkOceanBlue)
                        .fontWeight(.bold)
                )
                .padding(5)
            VStack {
                Text(ticker)
                    .font(.custom("Avenir", size: 22))
                    .fontWeight(.semibold)
                Text(cryptocurrency)
                    .font(.custom("Avenir", size: 15))
                    .fontWeight(.light)
                    .foregroundColor(Color.darkGray)
            }
            Spacer()
            Image(logo)
                .resizable()
                .scaledToFit()
                .frame(width: 42)
                .padding(2)
            Spacer()
            Rectangle()
                .fill(Color.darkOceanBlue)
                .frame(width: 130, height: 40)
                .cornerRadius(5)
                .overlay(
                    Text("$\(price, specifier: "%.2f")")
                        .font(.custom("Avenir", size: 20))
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                )

        }
        .frame(maxWidth: .infinity)
        .listRowBackground(Color.lightGray.opacity(0.15))
        .ignoresSafeArea()
    }
}


