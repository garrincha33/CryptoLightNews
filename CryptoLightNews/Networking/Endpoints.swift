//
//  Endpoints.swift
//  CryptoLightNews
//
//  Created by Richard Price on 21/12/2022.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseURL: URL { get }
}
enum CryptoNewsAPI: String {
    case getNews
    case getPrices
}
extension CryptoNewsAPI: APIBuilder {
    var baseURL: URL {
        switch self {
        case .getNews:
            return URL(string: FULL_CRYPTO)!
        case .getPrices:
            return URL(string: NEW_FULL_COINS)!
        }
    }
    var urlRequest: URLRequest {
        guard let url = URL(string: self.baseURL.absoluteString) else { fatalError("no url") }
        print("\(url)")
        return URLRequest(url: url)
    }
}