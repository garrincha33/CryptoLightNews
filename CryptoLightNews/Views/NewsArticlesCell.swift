//
//  CustomNewsControllerCell.swift
//  CryptoLightNews
//
//  Created by Richard Price on 03/01/2023.
//

import Foundation
import UIKit

class NewsArticlesCell: UICollectionViewCell {
  
  lazy var articleLabel: UILabel = {
    let lable = UILabel()
    lable.textColor = .red
    return lable
  }()
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(with viewModel: NewsArticles) {
    self.articleLabel.text = viewModel.title
  }
}
