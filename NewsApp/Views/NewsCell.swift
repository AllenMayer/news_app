//
//  NewsCell.swift
//  NewsApp
//
//  Created by Максим Семений on 26.06.2020.
//  Copyright © 2020 Максим Семений. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier = "NewsCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "NewsCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
