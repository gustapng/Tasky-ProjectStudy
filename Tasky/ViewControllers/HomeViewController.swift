//
//  ViewController.swift
//  Tasky
//
//  Created by Gustavo Ferreira dos Santos on 11/08/24.
//

import UIKit

class  HomeViewController: UIViewController {
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: AssetsConstants.logo))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var mainIllustrationImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: AssetsConstants.homeIllustration))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var getReadyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Prepare-se para conquistar o dia, uma lista de cada vez."
        label.textColor = UIColor(named: AssetsConstants.darkPurple)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22.0, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var getStartedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Vamos começar!", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = UIColor(named: AssetsConstants.darkPurple)
        button.layer.cornerRadius = 12.0
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapGetStartedButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addGradientBackground()
        addSubviews()
        setupConstraints()
    }
    
    @objc func didTapGetStartedButton() {
        navigationController?.pushViewController(TasksViewController(), animated: true)
    }

    private func addSubviews() {
        view.addSubview(logoImageView)
        view.addSubview(mainIllustrationImageView)
        view.addSubview(getReadyLabel)
        view.addSubview(getStartedButton)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mainIllustrationImageView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 8.0),
            mainIllustrationImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            getReadyLabel.topAnchor.constraint(equalTo: mainIllustrationImageView.bottomAnchor, constant: 32.0),
            getReadyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26.0),
            getReadyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26.0),
            
            getStartedButton.topAnchor.constraint(equalTo: getReadyLabel.bottomAnchor, constant: 32.0),
            getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getStartedButton.widthAnchor.constraint(equalToConstant: 162.0),
            getStartedButton.heightAnchor.constraint(equalToConstant: 44.0)
        ])
    }
}

