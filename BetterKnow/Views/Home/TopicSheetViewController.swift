//
//  TopicSheetViewController.swift
//  BetterKnow
//
//  Created by Denielle Abaquita on 10/9/21.
//

import UIKit

class TopicSheetViewController: UIViewController {

    var titleLabel = UILabel()
    var descLabel = UILabel()
    var contentView = UIView()
    var scrollView = UIScrollView()
    
    private let topics: Topic
    
    init(topics: Topic) {
        self.topics = topics
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modalPresentationStyle = .pageSheet
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named:"BetterKnowTopicSheetBG.svg"))
        view.backgroundColor = Colors.offWhite2
        
        configureScrollView()
    }
    
    func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
    
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        configureTitleLabel()
        configureDescriptionLabel()
    }
    
    func configureTitleLabel() {
        titleLabel.numberOfLines = 0
        titleLabel.font = .systemFont(ofSize: 30)
        titleLabel.text = topics.title
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 40)
        titleLabel.sizeToFit()
        titleLabel.textColor = Colors.peach
        contentView.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }
    
    func configureDescriptionLabel() {
        descLabel.numberOfLines = 0
        descLabel.font = .systemFont(ofSize: 15)
        descLabel.text = topics.description
        descLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
        descLabel.sizeToFit()
        descLabel.textColor = Colors.peach
        contentView.addSubview(descLabel)
        
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            descLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            descLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
}
