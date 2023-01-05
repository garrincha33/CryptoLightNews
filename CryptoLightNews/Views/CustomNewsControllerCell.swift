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
        lable.backgroundColor = UIColor(displayP3Red: 192/255, green: 19/155, blue: 57/277, alpha: 0.5)
        lable.textAlignment = .center
        lable.layer.cornerRadius = 16
        lable.clipsToBounds = true
        lable.layer.shadowRadius = 10
        lable.layer.shadowOpacity = 0.5
        lable.textColor = UIColor.white
        lable.numberOfLines = -1
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    var titleContainer: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .yellow
        iv.alpha = 0.06
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 16
        iv.layer.shadowRadius = 10
        iv.layer.shadowOpacity = 0.2
        return iv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    var item: NewsArticles? {
        didSet {
            articleLable.text = item?.title
            
        }
    }
    
    private func setupUI() {
        addSubview(titleContainer)
        titleContainer.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleContainer.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        titleContainer.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        titleContainer.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        addSubview(articleLable)
        articleLable.topAnchor.constraint(equalTo: titleContainer.topAnchor).isActive = true
        articleLable.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        articleLable.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        articleLable.widthAnchor.constraint(equalToConstant: 100).isActive = true
        articleLable.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
