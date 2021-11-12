import UIKit
import PlaygroundSupport
import Foundation
PlaygroundPage.current.needsIndefiniteExecution = true

let queryDictionary = ["term": "Kung Fu Panda", "media": "movie", "explicit": "No", "limit": "1000000"]

let itunesURL = URL(string: "https://itunes.apple.com/search")!
var components = URLComponents(url: itunesURL, resolvingAgainstBaseURL: false)
components?.queryItems = queryDictionary.map({ keyValue in
    URLQueryItem(name: keyValue.key, value: keyValue.value)
    
})
URLSession.shared.dataTask(with: components!.url!) { data, response, error in
    if let data = data, let dataString = String(data: data, encoding: .utf8) {
        print(dataString)
    }
}.resume()

extension Data {
    func prettyPrintedJSONString() {
        guard
            let jsonObject = try?
               JSONSerialization.jsonObject(with: self,
               options: []),
            let jsonData = try?
               JSONSerialization.data(withJSONObject:
               jsonObject, options: [.prettyPrinted]),
            let prettyJSONString = String(data: jsonData,
               encoding: .utf8) else {
                print("Failed to read JSON Object.")
                return
        }
        print(prettyJSONString)
    }
}
URLSession.shared.dataTask(with: components!.url!) { (data,
   response, error) in
    if let data = data {
        data.prettyPrintedJSONString()
        PlaygroundPage.current.finishExecution()
    }
}.resume()

struct StoreItem: Codable {
    var artistName: String
    var trackName: String
    var kind: String
    var artWorkURL: String
    
    enum CodingKeys: String, CodingKeys {
        case artistName = "Mark Obsborne & John Stevenson"
        case trackName = "Kung Fu"
        case kind = "feature-movie"
        var artWorkURL = URL(string: "https://is3-ssl.mzstatic.com/image/thumb/Video62/v4/44/93/36/44933600-762f-4130-7652-3314ecff36e7/source/30x30bb.jpg")
    }
}

