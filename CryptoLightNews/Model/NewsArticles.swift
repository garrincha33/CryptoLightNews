//
//  NewsArticles.swift
//  CryptoLightNews
//
//  Created by Richard Price on 21/12/2022.
//

import Foundation

struct NewsArticles: Codable {
    var title: String?
    var url: String?
    var urlToImage: String?
    var author: String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case url
        case urlToImage
        case author
    }
}
struct SearchResults: Codable {
    let status: String
    let totalResults: Int
    let articles: [NewsArticles]
}
