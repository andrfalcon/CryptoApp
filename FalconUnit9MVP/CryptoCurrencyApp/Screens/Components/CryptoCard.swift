import SwiftUI
import iLineChart
import iColor

// This struct makes up the line graph component for the cryptocurrencies displayed on HomeScreen() using the iLineChart and iColor packages
struct CryptoCard: View {
    
    @State var ticker: String
    @State var prices: [String]
    var sparkline: [Double] { // api returns price data in [String], but the data needs to be of type [Double] in order to be graphed by iLineChart - convert the array to doubles
        var data: [Double] = []
        for i in 0..<prices.count {
            data.append(Double(prices[i]) ?? 0.0)
        }
        return data
    }
    var cryptocurrency: String { // the full name of the cryptocurrencies is not available on the api I used so I made use of a computed property to do it instead
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
        VStack {
            iLineChart(
                data: sparkline,
                title: "\(ticker)",
                subtitle: "\(cryptocurrency)",
                lineGradient: GradientColor(start: Color.neonGreen, end: Color.neonOceanBlue),
                chartBackgroundGradient: GradientColor(start: Color.neonGreen, end: Color.neonOceanBlue),
                curvedLines: true,
                displayChartStats: true,
                fullScreen: true,
                floatingPointNumberFormat: "%.4f"
            )

        }
    }
}



