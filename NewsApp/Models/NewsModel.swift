//
//  NewsModel.swift
//  NewsApp
//
//  Created by Максим Семений on 26.06.2020.
//  Copyright © 2020 Максим Семений. All rights reserved.
//

import Foundation

struct News: Codable {
    let articles: [Articles]
}

struct Articles: Codable {
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}
