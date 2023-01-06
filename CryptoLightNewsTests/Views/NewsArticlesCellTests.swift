//
//  NewsArticlesCell.swift
//  CryptoLightNewsTests
//
//  Created by Ana Nogal on 5/1/23.
//

import XCTest
@testable import CryptoLightNews

final class NewsArticlesCellTests: XCTestCase {
  var cell: NewsArticlesCell!
  
  override func setUp()  {
    super.setUp()
    cell = NewsArticlesCell()
  }
  
  override func tearDown()  {
    cell = nil
    super.tearDown()
  }
  
  func testArticleLabel() {
    XCTAssertNotNil(cell.articleLabel)
    XCTAssertEqual(cell.articleLabel.textColor, .red)
  }
  
  func testCellConfigurationSetsArticuleLabel() {
    let expectedTitle = "Title"
    let item = NewsArticles(title: expectedTitle)
    
    cell.configure(with: item)
    
    XCTAssertEqual(cell.articleLabel.text, item.title)
  }
  
}
