//
//  ViewController.swift
//  CookieClicker
//
//  Created by Ricardo Montemayor on 29/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - PROPERTIES
    
    private var counter = 0
    
    // MARK: - SUBVIEWS
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [counterLabel, cookieButton])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 64, bottom: 0, right: 64)    // padding
        stackView.isLayoutMarginsRelativeArrangement = true // activate padding
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var counterLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 64, weight: .heavy)
        return label
    }()
    
    private lazy var cookieButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cookie"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(pressedCookie), for: .touchUpInside)
        return button
    }()
    
    
    
    // MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - SETUP
    
    private func setup() {
        view.backgroundColor = .white
        
        setupSubviews()
        setupConstraints()
    }
    
    /// Add subviews
    private func setupSubviews() {
        view.addSubview(stackView)
    }
    
    /// Add constraints to subviews
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // MARK: - ACTIONS
    
    @objc private func pressedCookie() {
        counter += 1
        counterLabel.text = "\(counter)"
    }
}

