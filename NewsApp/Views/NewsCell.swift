//
//  NewsCell.swift
//  NewsApp
//
//  Created by Максим Семений on 26.06.2020.
//  Copyright © 2020 Максим Семений. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    let imageview = NewsImageView()
    let titleLabel = UILabel()
    
    static let identifier = "NewsCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    private func configureCell() {
        contentView.addSubview(imageview)
        contentView.addSubview(titleLabel)
        
        imageview.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageview.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            imageview.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            imageview.widthAnchor.constraint(equalTo: contentView.heightAnchor, constant: 20),
            
            titleLabel.leadingAnchor.constraint(equalTo: imageview.trailingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.topAnchor.constraint(equalTo: imageview.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: imageview.bottomAnchor)
        ])
        
        imageview.contentMode = .scaleAspectFill
        imageview.layer.masksToBounds = true
        imageview.layer.cornerRadius = 15
        
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "Helvetica", size: self.frame.height / 3)
        
        self.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
