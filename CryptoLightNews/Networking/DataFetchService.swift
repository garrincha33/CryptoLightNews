//
//  DataFetchService.swift
//  CryptoLightNews
//
//  Created by Richard Price on 23/12/2022.
//

import Foundation

class DataFetcherService {
    
    let networkService: Service
    
    init(networkService: Service) {
        self.networkService = networkService
    }
}
