//
//  DataFetchService.swift
//  CryptoLightNews
//
//  Created by Richard Price on 23/12/2022.
//

import Foundation

protocol Fetchable {
    func fetchData()
}

class DataFetcherService {
    
    let networkService: Service
    
    init(networkService: Service) {
        self.networkService = networkService
    }
}







