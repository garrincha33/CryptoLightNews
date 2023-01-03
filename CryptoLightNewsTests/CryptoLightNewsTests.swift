//
//  CryptoLightNewsTests.swift
//  CryptoLightNewsTests
//
//  Created by Richard Price on 02/01/2023.
//

import XCTest

@testable import CryptoLightNews


final class CryptoLightNewsTests: XCTestCase {
    
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
        super.setUp()
    }
    
    func testItemPropertyTitleWhenSet() {
        let cell = CustomNewsControllerCell(frame: .zero)
        let item = NewsArticles(title: "test title")
        cell.item = item
        XCTAssertEqual(cell.item?.title, item.title)
    }
    
    func testArticleLabel() {
        let cell = CustomNewsControllerCell()
        XCTAssertNotNil(cell.articleLable)
        XCTAssertEqual(cell.articleLable.textColor, .red)
    }
    func testCellForItem() {
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = viewController.collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CustomNewsControllerCell.self), for: indexPath)
        XCTAssertNotNil(cell)
        XCTAssertTrue(cell is CustomNewsControllerCell)
    }
    
    func testForNumberOfItemsInSection() {
        XCTAssertEqual(viewController.collectionView.numberOfItems(inSection: 0), viewController.items.count)
    }

}



