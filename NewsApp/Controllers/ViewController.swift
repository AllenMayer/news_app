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
        configureTableView()
        
        viewModel.fetchNews(for: "us") {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsCell.nib(), forCellReuseIdentifier: NewsCell.identifier)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height / 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.identifier, for: indexPath) as! NewsCell 
        viewModel.configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
}

