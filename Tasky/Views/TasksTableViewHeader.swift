//
//  TasksTableViewHeader.swift
//  Tasky
//
//  Created by Gustavo Ferreira dos Santos on 12/08/24.
//

import UIKit

class TasksTableViewHeader: UIView {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Tarefas"
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        label.textColor = UIColor(named: AssetsConstants.darkPurple)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var addTaskButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let plusImage = UIImage(systemName: "plus")
        button.setImage(plusImage, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubview() {
        addSubview(titleLabel)
        addSubview(addTaskButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            addTaskButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20.0),
            addTaskButton.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
