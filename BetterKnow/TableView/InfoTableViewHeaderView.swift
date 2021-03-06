//
//  InfoTableViewHeaderView.swift
//  BetterKnow
//
//  Created by Denielle Abaquita on 10/9/21.
//

import UIKit

class InfoTableViewHeaderView: UITableViewHeaderFooterView {

    static let identifier = "InfoTableViewHeaderView"
    
    let title: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = Colors.peach
        label.font = .systemFont(ofSize: 40, weight: .semibold)
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        title.sizeToFit()
        title.frame = CGRect(
            x: contentView.frame.origin.x + 20,
            y: contentView.frame.size.height - title.frame.size.height - 20,
            width: contentView.frame.size.width,
            height: title.frame.size.height
        )
    }
    
}
