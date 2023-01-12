//
//  NewsViewControllerTests.swift
//  NewsViewControllerTests
//
//  Created by Richard Price on 02/01/2023.
//

import XCTest

@testable import CryptoLightNews

final class NewsViewControllerTests: XCTestCase {
    
    var viewController: NewsViewController!
    var testService: DataFetcherService!
    
    override func setUp() {
        super.setUp()
        viewController = NewsViewController()
        viewController.loadViewIfNeeded()
        testService = DataFetcherService(networkService: Service.init())
    }
    
    override func tearDown() {
        viewController = nil
        super.tearDown()
    }
    
    func testCellForItem() {
        let indexPath = IndexPath(row: 0, section: 0)
        let newsArticle = NewsArticles(title: makeTitle("test"))
        let cell =
        viewController.collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CustomNewsControllerCell.self), for: indexPath) as! CustomNewsControllerCell
        cell.configuration(with: newsArticle)
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell.articleLable.text, newsArticle.title)
    }
    
    func testForNumberOfItemsInSection() {
        XCTAssertEqual(viewController.numberOfItems, viewController.items.count)
    }
    
    func testTitleContainerSetupValues() {
        let cell = CustomNewsControllerCell()
        let titleContainer = cell.titleContainer
        XCTAssertNotNil(titleContainer)
        XCTAssertEqual(titleContainer.backgroundColor, UIColor.yellow)
        XCTAssertEqual(titleContainer.translatesAutoresizingMaskIntoConstraints, false)
        XCTAssertEqual(titleContainer.clipsToBounds, true)
        XCTAssertEqual(titleContainer.layer.shadowRadius, 10)
        XCTAssertEqual(titleContainer.layer.shadowOpacity, 0.2)
    }
    
    func makeTitle(_ string: String) -> String {
        string
    }
}

private extension NewsViewController {
    var numberOfItems: Int {
        collectionView.numberOfItems(inSection: 0)
    }
}



