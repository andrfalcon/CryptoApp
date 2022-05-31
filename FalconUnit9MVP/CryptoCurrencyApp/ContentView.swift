import SwiftUI
import iColor

struct ContentView: View {
    var body: some View {
        TabView {
            HomeScreen()
                .tabItem {
                    Label("Price Tracker", systemImage: "chart.bar.fill")
                }

            LeaderboardScreen()
                .tabItem {
                    Label("Leaderboard", systemImage: "list.number")
                }
        }.accentColor(Color.darkOceanBlue)
    }
}
