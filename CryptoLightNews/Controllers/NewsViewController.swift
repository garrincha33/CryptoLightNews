//
//  NewsViewController.swift
//  CryptoLightNews
//
//  Created by Richard Price on 02/01/2023.
//

import Foundation
import UIKit

class NewsViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private enum Sizes {
        
        static let offset = CGFloat(70)
        
        static func width(view: UIView) -> CGFloat {
            return (view.frame.width - 3 * 8) / 2 + 155
        }
    }
    
    var service = DataFetcherService(networkService: Service.init())
    var items: [NewsArticles] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupUI()
        fetchData()
    }
    
    private func SetupUI() {
        collectionView.dataSource = self
        collectionView.backgroundColor = .darkGray
        collectionView.register(CustomNewsControllerCell.self, forCellWithReuseIdentifier: String(describing: CustomNewsControllerCell.self))
    }
    
    private func fetchData() {
        service.networkService.fetchNews() { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case.success(let news):
                    self.items = news.articles
                case.failure(let error):
                    print(error.localizedDescription)
                }
                self.collectionView.reloadData()
            }
        }
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Sizes.width(view: collectionView), height: Sizes.width(view: collectionView) - Sizes.offset)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CustomNewsControllerCell.self), for: indexPath) as? CustomNewsControllerCell else {
            return UICollectionViewCell()
        }
        cell.configuration(with: items[indexPath.item])
        return cell
    }
}
