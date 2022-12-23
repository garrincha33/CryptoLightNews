//
//  CryptoNewsErrors.swift
//  CryptoLightNews
//
//  Created by Richard Price on 21/12/2022.
//

import Foundation

enum CryptoNewsErrors: String, Error {
    case networkError = "sorry a network error occured"
    case urlError = "unable to verify the URL"
    case httpError = "unable to verifiy this web address"
    case dataError = "There was an issue parsing the data"
}
