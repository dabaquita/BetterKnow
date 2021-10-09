//
//  ViewController.swift
//  BetterKnow
//
//  Created by Denielle Abaquita on 10/9/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    let mainVerticalScrollView = UIScrollView()
    let categoryTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Home"
        
        configureTableView()
    }
    
    private func configureTableView() {
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        categoryTableView.register(InfoCell.self, forCellReuseIdentifier: InfoCell.identifier)
        categoryTableView.register(InfoTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: InfoTableViewHeaderView.identifier)
        view.addSubview(categoryTableView)
        
        // Constraints
        categoryTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            categoryTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            categoryTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            categoryTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return view.bounds.height / 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(
                withIdentifier: InfoTableViewHeaderView.identifier
        ) as? InfoTableViewHeaderView else {
            print("ATTENTION - Could not get InfoTableViewHeaderView")
            return UITableViewHeaderFooterView()
        }
        if section == 1 {
            header.title.text = "Categories"
        } else {
            header.title.text = "Featured"
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height / 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: InfoCell.identifier,
            for: indexPath
        ) as? InfoCell else {
            print("ATTENTION - Could not load Info Cell")
            return UITableViewCell()
        }
        
        // Configure cell properties here
        cell.largeContentTitle = "HELLO WORLD"
        
        return cell
    }
}

