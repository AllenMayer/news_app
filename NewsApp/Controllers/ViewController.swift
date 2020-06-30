//
//  ViewController.swift
//  NewsApp
//
//  Created by Максим Семений on 26.06.2020.
//  Copyright © 2020 Максим Семений. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var viewModel: ViewModel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Top Headlines"
        configureTableView()
        
        PersistenceManager.retreiveArticles { (result) in
            switch result {
            case .success(let articles):
                print(articles)
            case .failure(let error):
                print(error.rawValue)
            }
        }
        
        viewModel.fetchNews(for: "us") {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsCell.self, forCellReuseIdentifier: NewsCell.identifier)
        tableView.register(HeadNewsCell.self, forCellReuseIdentifier: HeadNewsCell.identifier)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 300 : 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            indexPath.row == 0
                ? tableView.dequeueReusableCell(withIdentifier: HeadNewsCell.identifier, for: indexPath) as! HeadNewsCell
                : tableView.dequeueReusableCell(withIdentifier: NewsCell.identifier, for: indexPath) as! NewsCell
        indexPath.row == 0
            ? viewModel.configureHeadCell(cell: cell as! HeadNewsCell, indexPath: indexPath)
            : viewModel.configureCell(cell: cell as! NewsCell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let destVC = storyboard?.instantiateViewController(identifier: NewsDetailsVC.storyboardID) as! NewsDetailsVC
        viewModel.configureNewsDetailVC(newsDetailsVC: destVC, indexPath: indexPath)
        let nav = UINavigationController(rootViewController: destVC)
        navigationController?.present(nav, animated: true)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let saveAction = UIContextualAction(style: .normal, title: "Save") { [weak self] (action, view, completion) in
            guard let self = self else { return }
            guard let article = self.viewModel.news?.articles[indexPath.row] else { return }
            PersistenceManager.updateWith(article: article, actionType: .add) { error in
                guard let error = error else {
                    print("saved!")
                    return
                }
                print(error.rawValue)
            }
            completion(true)
        }
        saveAction.image = UIImage(systemName: "bookmark.fill")
        return UISwipeActionsConfiguration(actions: [saveAction])
    }
}
