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
    var stackView = UIStackView()
    
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
        modalPresentationStyle = .formSheet
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named:"BetterKnowTopicSheetBG.svg"))
        view.backgroundColor = .systemTeal
        
        configureStackView()

        
    }
    
    func configureStackView() {
        stackView.axis = .vertical
        stackView.alignment = .top
        stackView.distribution = .equalCentering
        view.addSubview(stackView)
    
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        configureTitleLabel()
        configureDescriptionLabel()
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descLabel)
       
        
    }
    
    func configureTitleLabel() {
        titleLabel.numberOfLines = 0
        titleLabel.font = .systemFont(ofSize: 30)
        titleLabel.text = topics.title
        titleLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 40)
        
    }
    
    func configureDescriptionLabel() {
        descLabel.numberOfLines = 0
        descLabel.font = .systemFont(ofSize: 15)
        descLabel.text = topics.description
        descLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 20)


    }
    


    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
