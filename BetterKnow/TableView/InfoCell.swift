//
//  InfoCell.swift
//  BetterKnow
//
//  Created by Denielle Abaquita on 10/9/21.
//

import UIKit

class InfoCell: UITableViewCell {
    
    static let identifier = "InfoCell"
    
    let button = UIButton()
    var buttonHandler: (() -> Void)?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        // Button config
        button.titleLabel?.font = .systemFont(ofSize: 23, weight: .semibold)
        button.layer.cornerRadius = 10
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25);
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        button.titleLabel?.numberOfLines = 0
        button.startAnimatingPressActions()
        contentView.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Selectors
    @objc func didTapButton(_ sender: Any) {
        if let buttonHandler = buttonHandler {
            buttonHandler()
        }
    }
    
}

extension UIButton {
    func startAnimatingPressActions() {
        addTarget(self, action: #selector(animateDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(animateUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
    }
    
    @objc private func animateDown(sender: UIButton) {
        animate(sender, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
    }
    
    @objc private func animateUp(sender: UIButton) {
        animate(sender, transform: .identity)
    }
    
    private func animate(_ button: UIButton, transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 3,
                       options: [.curveEaseInOut],
                       animations: {
                        button.transform = transform
            }, completion: nil)
    }
}
