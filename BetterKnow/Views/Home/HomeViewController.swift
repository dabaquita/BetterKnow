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
    
    let catData: [Category] = Category.FetchCategories()
    
    public let featData: [Category] = [
    Category(title: "Love your mom", image: UIImage(systemName: "pills")!, topics: [Topic(title: "Love your Dad too", description: "Gotta love your parents baby")]),
    Category(title: "Love your brother", image: UIImage(systemName: "book")!, topics: [Topic(title: "Love your sister too", description: "Gotta love your siblings baby")])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "BetterKnow"
        
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
        // Categories section
        if section == 1 {
            return 4
        }
        // Feature section
        else {
            return 2
        }
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
            header.contentView.backgroundColor = Colors.navy
            header.title.text = "Categories"
        } else {
            header.contentView.backgroundColor = Colors.orange
            header.title.text = "Featured"
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height / 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: InfoCell.identifier,
            for: indexPath
        ) as? InfoCell else {
            print("ATTENTION - Could not load Info Cell")
            return UITableViewCell()
        }
        
        // Configure Categories section cells
        if indexPath.section == 1 {
            cell.backgroundColor = Colors.blue
            cell.button.backgroundColor = Colors.navy
            cell.buttonHandler = { [weak self] in
                guard let self = self else { return }
                let cvc = CategoryViewController(category: self.catData[indexPath.row])
                self.navigationController?.pushViewController(cvc, animated: true)
            }
            cell.button.setTitle(catData[indexPath.row].title, for: .normal)
        }
        // Configure Featured section cells
        else {
            cell.backgroundColor = Colors.lightOrange
            cell.button.backgroundColor = Colors.orange
            cell.buttonHandler = { [weak self] in
                guard let self = self else { return }
                let cvc = CategoryViewController(category: self.featData[indexPath.row])
                self.navigationController?.pushViewController(cvc, animated: true)
            }
            cell.button.setTitle(featData[indexPath.row].title, for: .normal)
        }
        
        return cell
    }
}

