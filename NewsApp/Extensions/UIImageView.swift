//
//  UIImage.swift
//  NewsApp
//
//  Created by Максим Семений on 26.06.2020.
//  Copyright © 2020 Максим Семений. All rights reserved.
//

import UIKit

extension UIImageView {
    func downloadFromUrl(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else { return }
            guard let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
    
    func downloadFromLink(link: String) {
        guard let url = URL(string: link) else { return }
        downloadFromUrl(url: url)
    }
}
