import SwiftUI

// This struct makes up the component for the time axis under the line chart in HomeScreen()
struct TimeAxis: View {
    
    let id = UUID()
    var yearsArray: [String] = ["2016", "2017", "2018", "2019", "2020", "2021"]
    
    var body: some View {
        HStack {
            ForEach(yearsArray, id: \.self) { year in
                VStack {
                    Image(systemName: "arrowtriangle.up.circle")
                        .font(.system(size: 10.0))
                    Text(year)
                        .font(.custom("Avenir", size: 15))
                        .fontWeight(.bold)
                        .foregroundColor(.darkOceanBlue)
                }
                .frame(maxWidth: .infinity) // evenly arranges views across the screen
            }
        }
    }
}

