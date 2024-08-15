//
//  AddTaskViewController.swift
//  Tasky
//
//  Created by Gustavo Ferreira dos Santos on 13/08/24.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    weak var delegate: TaskDelegate?
    
    private lazy var addTaskLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Adicionar tarefa"
        label.font = .systemFont(ofSize: 20.0, weight: .bold)
        label.textColor = UIColor(named: AssetsConstants.darkPurple)
        label.textAlignment = .center
        return label
    }()	
    
    private lazy var dismissViewButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let closeImage = UIImage(systemName: "xmark")
        button.setImage(closeImage, for: .normal)
        button.tintColor = .gray
        button.addTarget(self, action: #selector(didTapDismissViewButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let input = UILabel()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.text = "Título"
        input.font = .systemFont(ofSize: 16, weight: .medium)
        return input
    }()
    
    private lazy var titleInput: UITextField = {
        let input = UITextField()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.placeholder = "Título da tarefa"
        input.font = .systemFont(ofSize: 16, weight: .regular)
        input.backgroundColor = UIColor(named: AssetsConstants.lightGray)
        input.layer.cornerRadius = 5.0
        input.layer.borderColor = UIColor(named: AssetsConstants.lightGray2)?.cgColor
        input.layer.borderWidth = 1.0
        input.setLeftPadding(12.0)
        input.setRightPadding(12.0)
        return input
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let input = UILabel()
        input.translatesAutoresizingMaskIntoConstraints = false
        input.text = "Descrição"
        input.font = .systemFont(ofSize: 16, weight: .medium)
        return input
    }()
    
    private lazy var descriptionInput: UITextField = {
        let input = UITextField()	
        input.translatesAutoresizingMaskIntoConstraints = false
        input.placeholder = "Descrição da tarefa"
        input.font = .systemFont(ofSize: 16, weight: .regular)
        input.backgroundColor = UIColor(named: AssetsConstants.lightGray)
        input.layer.cornerRadius = 5.0
        input.layer.borderColor = UIColor(named: AssetsConstants.lightGray2)?.cgColor
        input.layer.borderWidth = 1.0
        input.setLeftPadding(12.0)
        input.setRightPadding(12.0)
        return input
    }()
    
    private lazy var saveTaskButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Salvar", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.setTitleColor(UIColor(named: AssetsConstants.lilac), for: .normal)
        button.addTarget(self, action: #selector(didTapSaveTaskButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setupConstraints()
    }
    
    // MARK: Class methods
    
    @objc func didTapSaveTaskButton() {
        guard let title = titleInput.text, !title.isEmpty else {
            print("Precisa de um título")
            AlertHelper.showAlert(on: self, title: "Erro", message: "O título da tarefa não pode estar vazio.")
            return
        }
        
        let newTask = Task(title: title, description: descriptionInput.text)
        
        delegate?.didAddTask(newTask: newTask)
        
        dismiss(animated: true)
    }
    
    @objc func didTapDismissViewButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func addSubviews() {
        view.addSubview(addTaskLabel)
        view.addSubview(dismissViewButton)
        
        view.addSubview(titleLabel)
        view.addSubview(titleInput)
        
        view.addSubview(descriptionLabel)
        view.addSubview(descriptionInput)
        
        view.addSubview(saveTaskButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            addTaskLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 35.0),
            addTaskLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            dismissViewButton.centerYAnchor.constraint(equalTo: addTaskLabel.centerYAnchor),
            dismissViewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18.0),
            
            titleLabel.topAnchor.constraint(equalTo: addTaskLabel.bottomAnchor, constant: 35.0),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12.0),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12.0),

            titleInput.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5.0),
            titleInput.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12.0),
            titleInput.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12.0),
            titleInput.heightAnchor.constraint(equalToConstant: 40.0),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleInput.bottomAnchor, constant: 32.0),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12.0),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12.0),

            descriptionInput.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5.0),
            descriptionInput.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12.0),
            descriptionInput.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12.0),
            descriptionInput.heightAnchor.constraint(equalToConstant: 40.0),
            
            saveTaskButton.topAnchor.constraint(equalTo: descriptionInput.bottomAnchor, constant: 22.0),
            saveTaskButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
