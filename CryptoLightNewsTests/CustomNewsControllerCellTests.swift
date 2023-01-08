//
//  CustomNewsControllerCellTests.swift
//  CryptoLightNewsTests
//
//  Created by Richard Price on 05/01/2023.
//

import XCTest

@testable import CryptoLightNews

final class CustomNewsControllerCellTests: XCTestCase {
    
    func testItemPropertyTitleWhenSet() {
        let cell = CustomNewsControllerCell(frame: .zero)
        let item = NewsArticles(title: "test title")
        cell.configuration(with: item)
        XCTAssertEqual(cell.articleLable.text, item.title)
    }
    
    func testArticleLabelRendered() {
        let cell = CustomNewsControllerCell()
        XCTAssertNotNil(cell.articleLable)
        XCTAssertEqual(cell.articleLable.textColor, .white)
        XCTAssertEqual(cell.articleLable.textAlignment, .center)
        XCTAssertEqual(cell.articleLable.translatesAutoresizingMaskIntoConstraints, false)
        XCTAssertEqual(cell.articleLable.numberOfLines, -1)
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
    
}
