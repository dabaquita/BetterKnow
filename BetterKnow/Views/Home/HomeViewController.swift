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
    
    public let featData: [Topic] = [
        Topic(title: "Where can I find self-help materials for depression?", description: "Self-help resources are not a substitute for diagnosis or treatment. If you have concerns about low mood, it’s best to talk to your doctor first and rule out physical causes for your symptoms. However, once you’ve checked in with your doctor, self-help materials can be a great way to learn more about depression and practice different skills at your own pace or in between treatment sessions. Here are some resources to check out.\nOften depression can affect your concentration and motivation to work through self-help materials on your own. If you’d like self-help materials with a bit of extra support from a person, Bounce Back: Reclaim Your Health is a guided self-help program for British Columbians who experience mild to moderate depression, low mood, stress, or anxiety. You can get a DVD of tips to help you recognize and manage symptoms of depression, or you can learn more in-depth skills in a series of workbooks you complete at home. You also work with a trained coach from the Canadian Mental Health Association who will offer support and advice by telephone or video conference. Bounce Back is free with a doctor’s referral. For more information, visit www.bouncebackbc.ca (If you want to access the Bounce Back materials without a coach or referral, you can do that online in BC at www.bouncebackonline.ca)."),
        Topic(title: "I received a diagnosis but I don’t think it’s right. What can I do?", description: "If possible, bring up your concerns with the professional who provided the diagnosis. That way, the professional can answer your questions and you can better understand their decision.\nIf that doesn’t resolve the situation or a follow-up appointment isn’t possible, you can ask for a second opinion. A second opinion is an assessment from a different professional. This can give you better understanding of what’s going on and what to do about it. Second opinions are common when it comes to major health decisions—you won’t hurt anyone’s feelings and your doctor will try to accommodate reasonable requests for a second opinion. Talk to your family doctor (or go to a walk-in clinic) to discuss your options and get a referral to a different program or health professional, if needed.")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.offWhite2
        navigationController?.navigationBar.isHidden = true
        
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func configureTableView() {
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        categoryTableView.register(InfoCell.self, forCellReuseIdentifier: InfoCell.identifier)
        categoryTableView.register(InfoTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: InfoTableViewHeaderView.identifier)
        categoryTableView.backgroundColor = Colors.offWhite2
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
        header.contentView.backgroundColor = Colors.offWhite2
        if section == 1 {
            header.title.text = "Categories"
        } else {
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
            cell.backgroundColor = Colors.offWhite2
            cell.button.backgroundColor = Colors.peach
            cell.buttonHandler = { [weak self] in
                guard let self = self else { return }
                let cvc = CategoryViewController(category: self.catData[indexPath.row])
                self.navigationController?.pushViewController(cvc, animated: true)
            }
            cell.button.setTitle(catData[indexPath.row].title, for: .normal)
        }
        // Configure Featured section cells
        else {
            cell.backgroundColor = Colors.offWhite2
            cell.button.backgroundColor = Colors.peach
            cell.buttonHandler = { [weak self] in
                guard let self = self else { return }
                let topicVC = TopicSheetViewController(topics: self.featData[indexPath.row])
                self.present(topicVC, animated: true)
            }
            cell.button.setTitle(featData[indexPath.row].title, for: .normal)
        }
        
        return cell
    }
}

