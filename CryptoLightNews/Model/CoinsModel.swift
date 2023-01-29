//
//  CoinsModel.swift
//  CryptoLightNews
//
//  Created by Richard Price on 27/01/2023.
//

import Foundation

struct CoinsModel: Codable {
    var name: String?
    var symbol: String?
    var rank: Int?
    var id: String?
    var price_usd: String?
    var market_cap_usd: String?
    var percent_change_1h: String?
    var percent_change_24h: String?
    var percent_change_7d: String?
}

struct SearchResultsCoins: Codable {
    let data: [CoinsModel]
}
