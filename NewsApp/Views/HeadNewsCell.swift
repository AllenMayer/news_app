//
//  HeadNewsCell.swift
//  NewsApp
//
//  Created by Максим Семений on 27.06.2020.
//  Copyright © 2020 Максим Семений. All rights reserved.
//

import UIKit

class HeadNewsCell: UITableViewCell {
    
    let imageview = NewsImageView()
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    
    static let identifier = "HeadNewsCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
        configureImage()
        configureTitle()
        configureDate()
    }
    
    private func configureCell() {
        contentView.addSubview(imageview)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            imageview.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            imageview.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            imageview.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: -20),
            imageview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -35),
            
            dateLabel.leadingAnchor.constraint(equalTo: imageview.leadingAnchor),
            dateLabel.topAnchor.constraint(equalTo: imageview.bottomAnchor, constant: 10)
        ])
        
        self.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
    }
    
    private func configureImage() {
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.contentMode = .scaleToFill
        imageview.layer.masksToBounds = true
        imageview.layer.cornerRadius = 15
    }
    
    private func configureTitle() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "Helvetica-Bold", size: self.frame.height / 2.5)
    }
    
    private func configureDate() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.font = UIFont(name: "Helvetica", size: self.frame.height / 3)
        dateLabel.textColor = .secondaryLabel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
