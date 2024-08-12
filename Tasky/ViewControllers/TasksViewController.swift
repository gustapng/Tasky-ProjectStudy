//
//  TasksViewController.swift
//  Tasky
//
//  Created by Gustavo Ferreira dos Santos on 11/08/24.
//

import UIKit

class TasksViewController: UIViewController {
        
    private lazy var tasksTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 24.0
        let header = TasksTableViewHeader(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64.0))
        tableView.tableHeaderView = header
        return tableView
    }()
    
    private lazy var taskIllustrationImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: AssetsConstants.taskIllustration))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        addGradientBackground()
        addSubviews()
        setupConstraints()
    }
    
    private func setupNavigationBar() {
        navigationItem.hidesBackButton = true
    }
    
    private func addSubviews() {
        view.addSubview(taskIllustrationImageView)
        view.addSubview(tasksTableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            taskIllustrationImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            taskIllustrationImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tasksTableView.topAnchor.constraint(equalTo: taskIllustrationImageView.bottomAnchor),
            tasksTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tasksTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tasksTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension TasksViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = tasks[indexPath.row].title
        content.secondaryText = tasks[indexPath.row].description ?? ""
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
