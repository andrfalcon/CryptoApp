import SwiftUI

// This struct makes up the error message displayed to the user when the JSON data cannot be retrieved
struct ErrorView: View {
    var body: some View {
        ZStack {
            VStack {
                Text("Cryp-to? More like cyrpt-no...")
                    .font(.custom("Avenir", size: 30))
                    .foregroundColor(Color.darkOceanBlue)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .padding()
                Text("We sincerely apologize for the inconvenience, but we are currently unable to access your cryptocurrency data. This error is likely due to weak or absent internet connection. Please connect to a stable internet source and restart the app to start accessing and tracking crytocurrency information. Thank you!")
                    .font(.custom("Avenir", size: 15))
                    .foregroundColor(Color.black)
                    .fontWeight(.light)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
        .frame(width: 0.9 * UIScreen.main.bounds.width, height: 0.45 * UIScreen.main.bounds.height, alignment: .center)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 5)
    }
}

