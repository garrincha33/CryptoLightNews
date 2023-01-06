//
//  CryptoLightNewsTests.swift
//  CryptoLightNewsTests
//
//  Created by Richard Price on 02/01/2023.
//

import XCTest

@testable import CryptoLightNews


final class NewsViewControllerTests: XCTestCase {
  
  var viewController: NewsViewController!
  // var mockAPIService: DataFetcherService!
  
  override func setUp() {
    super.setUp()
    viewController = NewsViewController()
    //mockAPIService = DataFetcherService(networkService: Service.init())
    //viewController.service = mockAPIService
    viewController.loadViewIfNeeded()
  }
  
  override func tearDown() {
    viewController = nil
    //mockAPIService = nil
    super.tearDown()
  }
  
  func testCellForItem() {
    let cell = viewController.dequeueNewsArticleCell
    XCTAssertNotNil(cell)
    XCTAssert(cell is NewsArticlesCell)
  }
  
  func testForNumberOfItemsInSection() {
    
    let result = viewController.numberOfItems
    
    XCTAssertEqual(result, viewController.items.count)
  }
  
}

private extension NewsViewController {
  
  var numberOfItems: Int {
    collectionView.numberOfItems(inSection: 0)
  }
  
  var dequeueNewsArticleCell: UICollectionViewCell {
    let indexPath = IndexPath(row: 0, section: 0)
    return collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: NewsArticlesCell.self), for: indexPath)
  }
}


