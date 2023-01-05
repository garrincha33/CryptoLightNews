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
    
    override func setUp() {
        super.setUp()
        viewController = NewsViewController()
        viewController.loadViewIfNeeded()
    }
    
    override func tearDown() {
        viewController = nil
        super.setUp()
    }
    
    func testItemPropertyTitleWhenSet() {
        let cell = CustomNewsControllerCell(frame: .zero)
        let item = NewsArticles(title: makeTitle("test title"))
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
        let expected = NewsArticles(title: makeTitle("test"))
        let cell =
        viewController.collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CustomNewsControllerCell.self), for: indexPath) as! CustomNewsControllerCell
        cell.item = expected
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell.item, expected)
    }
    
    func testForNumberOfItemsInSection() {
        XCTAssertEqual(viewController.numberOfItems, viewController.items.count)
    }
    
    func testTitleContainerIsNotNil() {
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



