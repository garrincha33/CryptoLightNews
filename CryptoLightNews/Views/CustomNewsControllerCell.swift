//
//  CustomNewsControllerCell.swift
//  CryptoLightNews
//
//  Created by Richard Price on 03/01/2023.
//

import Foundation
import UIKit

class CustomNewsControllerCell: UICollectionViewCell {
    
    let articleLable: UILabel = {
        let lable = UILabel()
        lable.textColor = .red
        return lable
    }()
    
    var item: NewsArticles? {
        didSet {
            articleLable.text = item?.title
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
