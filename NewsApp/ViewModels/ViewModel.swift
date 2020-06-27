//
//  ViewModel.swift
//  NewsApp
//
//  Created by Максим Семений on 26.06.2020.
//  Copyright © 2020 Максим Семений. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    @IBOutlet var newsClient: NewsClient!
    var news: News?
    
    func fetchNews(for country: String, completion: @escaping () -> ()) {
        newsClient.fetchNews(from: "http://newsapi.org/v2/top-headlines?country=\(country)&apiKey=5ef35dc066ed404abb123e8e53252332") { (news) in
            self.news = news
            completion()
        }
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return news?.articles.count ?? 0
    }
    
    func configureCell(cell: NewsCell, indexPath: IndexPath) {
        cell.imageview.loadImage(from: news?.articles[indexPath.row].urlToImage ?? "")
        cell.titleLabel.text = news?.articles[indexPath.row].title ?? ""
    }
    
    func configureHeadCell(cell: HeadNewsCell, indexPath: IndexPath) {
        cell.imageview.loadImage(from: news?.articles[indexPath.row].urlToImage ?? "")
        cell.titleLabel.text = news?.articles[indexPath.row].title ?? ""
        cell.dateLabel.text = news?.articles[indexPath.row].publishedAt?.convertDateFormat() ?? ""
    }
    
    func configureNewsDetailVC(newsDetailsVC: NewsDetailsVC, indexPath: IndexPath) {
        newsDetailsVC.article = news?.articles[indexPath.row]
    }
}
