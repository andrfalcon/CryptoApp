import Foundation
import SwiftUI

// This struct is the skeleton of the API's JSON response data
struct ResponseElement: Codable {
    let currency: String
    let timestamps: [String]
    let prices: [String]
}

typealias Response = [ResponseElement]

func getData(from urlString: String, completion: @escaping (Response) -> Void) {
    guard let url = URL(string: urlString) else {
        // if here, url was bad
        return
    }

    URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data {
            // data non-optional, i.e. it actually exists
            let decoder = JSONDecoder()
            if let cryptoData = try? decoder.decode(Response.self, from: data) {
                completion(cryptoData)
            }
        }
    }.resume()
}
