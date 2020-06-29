//
//  BookmarksVC.swift
//  NewsApp
//
//  Created by Максим Семений on 29.06.2020.
//  Copyright © 2020 Максим Семений. All rights reserved.
//

import UIKit

class BookmarksVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var bookmarkViewModel: BookmarkViewModel!
    
    var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getBookmarks()
    }
    
    private func getBookmarks() {
        PersistenceManager.retreiveArticles { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let articles):
                if articles.isEmpty {
                    print("Bookmarks are empty")
                }
                self.articles = articles
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.view.bringSubviewToFront(self.tableView)
                }
            case .failure(let error):
                print("something went wrong while retrieving bookmarks, \(error.rawValue)")
            }
        }
    }
    
    private func configureVC() {
        title = "Bookmarks"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.identifier)
    }
}

extension BookmarksVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.identifier, for: indexPath) as! NewsCell
        bookmarkViewModel.configureBookmarkCell(cell: cell, articles: articles, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let destVC = storyboard?.instantiateViewController(identifier: NewsDetailsVC.storyboardID) as! NewsDetailsVC
        bookmarkViewModel.configureDetailsVCfromBookmarks(newsDetailsVC: destVC, articles: articles, indexPath: indexPath)
        let nav = UINavigationController(rootViewController: destVC)
        navigationController?.present(nav, animated: true)
    }
}
