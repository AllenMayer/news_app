//
//  NewsDetailsVC.swift
//  NewsApp
//
//  Created by Максим Семений on 27.06.2020.
//  Copyright © 2020 Максим Семений. All rights reserved.
//

import UIKit

class NewsDetailsVC: UIViewController {
    static let storyboardID = "NewsDetailsVC"
    var article: Article? = nil
    
    let imageView = NewsImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureImage()
    }

    private func configureImage() {
        view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200)
        ])
        imageView.loadImage(from: article?.urlToImage ?? "")
    }
}
