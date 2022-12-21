//
//  BaseConstant.swift
//  CryptoLightNews
//
//  Created by Richard Price on 21/12/2022.
//

import Foundation
import UIKit

protocol APIKeyable {
    var API_KEY: String { get }
}
var FULL_CRYPTO = "https://newsapi.org/v2/everything?q=crypto&sortBy=publishedAt&apiKey=\(AccessAPIKey.API_KEY)"

var NEW_FULL_COINS = "https://api.coinlore.net/api/tickers/"

class APIBase {
    let dict: NSDictionary
    init(resourceName: String) {
        guard let filePath = Bundle.main.path(forResource: resourceName, ofType: "plist"), let plist = NSDictionary(contentsOfFile: filePath) else {
            fatalError("unable to find \(resourceName) plist")
        }
        self.dict = plist
    }
}
class Constants: APIBase, APIKeyable {
    init() {
        super.init(resourceName: "ApiKey")
    }
    var API_KEY: String {
        dict.object(forKey: "API_KEY") as? String ?? ""
    }
}
