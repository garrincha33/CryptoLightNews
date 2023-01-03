//
//  NewsViewController.swift
//  CryptoLightNews
//
//  Created by Richard Price on 02/01/2023.
//

import Foundation
import UIKit

class NewsViewController: UICollectionViewController {
    
    var service = DataFetcherService(networkService: Service())
    var items: [NewsArticles] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupUI()


    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.service.fetchNewsIsCalled = true
        service.networkService.fetchNews { news in
            

            
            
        }
    }
    
    private func SetupUI() {
        collectionView.backgroundColor = .darkGray
        collectionView.register(CustomNewsControllerCell.self, forCellWithReuseIdentifier: String(describing: CustomNewsControllerCell.self))
    }
    
    
    init() {
           super.init(collectionViewLayout: UICollectionViewFlowLayout())
       }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
}
