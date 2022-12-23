//
//  BaseConstant.swift
//  CryptoLightNews
//
//  Created by Richard Price on 21/12/2022.
//

import Foundation
import UIKit





enum Constants {
    
    private static let resourceName = "ApiKey"
    
    private static var apiBase: NSDictionary {
        guard let filePath = Bundle.main.path(forResource: resourceName, ofType: "plist"), let plist = NSDictionary(contentsOfFile: filePath) else {
            fatalError("unable to find \(resourceName) plist")
        }
        return plist
    }
    
    private static var API_KEY: String {
        Constants.apiBase.object(forKey: "API_KEY") as? String ?? ""
      }
    
    static let fullCrypto = "https://newsapi.org/v2/everything?q=crypto&sortBy=publishedAt&apiKey=\(Constants.API_KEY)"

    static let fullCoins = "https://api.coinlore.net/api/tickers/"
}
