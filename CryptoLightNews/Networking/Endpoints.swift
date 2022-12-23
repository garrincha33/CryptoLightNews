//
//  Endpoints.swift
//  CryptoLightNews
//
//  Created by Richard Price on 21/12/2022.
//

import Foundation

protocol APIBuilder {

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
            return URL(string: Constants.fullCrypto)!
        case .getPrices:
            return URL(string: Constants.fullCoins)!
        }
    }

}
