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
    
    func testArticleLabelRendered() {
        let cell = CustomNewsControllerCell()
        XCTAssertNotNil(cell.articleLable)
        XCTAssertEqual(cell.articleLable.textColor, .white)
        XCTAssertEqual(cell.articleLable.textAlignment, .center)
        XCTAssertEqual(cell.articleLable.translatesAutoresizingMaskIntoConstraints, false)
        XCTAssertEqual(cell.articleLable.numberOfLines, -1)
    }

    func testCellForItem() {
        let indexPath = IndexPath(row: 0, section: 0)
        let expected = NewsArticles(title: "test")
        let cell =
        
        viewController.collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CustomNewsControllerCell.self), for: indexPath) as! CustomNewsControllerCell
        cell.item = expected
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell.item, expected)
    }
    
    func testForNumberOfItemsInSection() {
        XCTAssertEqual(viewController.collectionView.numberOfItems(inSection: 0), viewController.items.count)
    }
    
    func testTitleContainerIsRendered() {
        let cell = CustomNewsControllerCell()
        XCTAssertNotNil(cell.titleContainer)
    }
    
    func testTitleContainerSetupValues() {
        let cell = CustomNewsControllerCell()
        let titleContainer = cell.titleContainer
        XCTAssertNotNil(titleContainer)
        XCTAssertEqual(titleContainer.backgroundColor, UIColor.yellow)
        XCTAssertEqual(titleContainer.translatesAutoresizingMaskIntoConstraints, false)
        XCTAssertEqual(titleContainer.clipsToBounds, true)
        XCTAssertEqual(titleContainer.layer.shadowRadius, 10)
        XCTAssertEqual(titleContainer.layer.shadowOpacity, 0.5)
        
    }
    
}



