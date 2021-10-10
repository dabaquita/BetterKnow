//
//  QuizViewController.swift
//  BetterKnow
//
//  Created by Denielle Abaquita on 10/9/21.
//

import UIKit

class LearnViewController: UIViewController {
    
    let tableView = UITableView()
    
    // let quizzes = Quiz.FetchQuizzes()
    // let featured = Feature.FetchFeatured()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.offWhite2
        navigationItem.title = "Learn"
        navigationController?.navigationBar.isHidden = true
        
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(InfoCell.self, forCellReuseIdentifier: InfoCell.identifier)
        tableView.register(InfoTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: InfoTableViewHeaderView.identifier)
        tableView.backgroundColor = Colors.offWhite2
        view.addSubview(tableView)
        
        // Constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}

extension LearnViewController: UITableViewDelegate, UITableViewDataSource {
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
        header.contentView.backgroundColor = Colors.offWhite2
        if section == 1 {
            header.title.text = "Quizzes"
        } else {
            header.title.text = "Featured"
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height / 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: InfoCell.identifier,
            for: indexPath
        ) as? InfoCell else {
            print("ATTENTION - Could not load Info Cell")
            return UITableViewCell()
        }
        
        // Configure Quiz section cells
        if indexPath.section == 1 {
            cell.backgroundColor = Colors.offWhite2
            cell.button.backgroundColor = Colors.peach
            cell.button.setTitle("Quiz", for: .normal)
            cell.buttonHandler = {
                print("Hello Quiz")
            }
        }
        // Configure Featured section cells
        else {
            cell.backgroundColor = Colors.offWhite2
            cell.button.backgroundColor = Colors.peach
            cell.button.setTitle("Featured", for: .normal)
            cell.buttonHandler = {
                print("Hello Featured")
            }
        }
        
        return cell
    }
    
    
}
