//
//  NewsArticles.swift
//  CryptoLightNews
//
//  Created by Richard Price on 21/12/2022.
//

import Foundation

struct Article: Codable {
    var title: String?
    var url: String?
    var urlToImage: String?
    var author: String?
}
struct Articles: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
