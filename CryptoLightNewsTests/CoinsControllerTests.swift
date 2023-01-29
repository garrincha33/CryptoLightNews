//
//  CoinsControllerTests.swift
//  CryptoLightNewsTests
//
//  Created by Richard Price on 27/01/2023.
//

import XCTest

@testable import CryptoLightNews

final class CoinsControllerTests: XCTest {
    
    var controller: CoinsController!
    
    override func setUp() {
        super.setUp()
        controller = CoinsController()
        controller.loadViewIfNeeded()
    }
    
    override func tearDown() {
        controller = nil
        super.tearDown()
    }
    
    func testCoinsControllerInitLoadsCorrectly() {
        XCTAssertNotNil(controller.collectionViewLayout as? UICollectionViewFlowLayout)
    }

    func testBackGroxundColourIsCorrect() {
        let color = UIColor.darkGray
        XCTAssertEqual(color, controller.collectionView.backgroundColor)
    }
}

