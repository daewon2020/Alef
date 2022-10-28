//
//  MainViewController.swift
//  Alef
//
//  Created by Константин Андреев on 26.10.2022.
//

import UIKit

protocol MainViewControllerProtocol: AnyObject {
    func childDidAdd()
    func childListDidClear()
    func hideAddButton()
    func showAddButton()
    func reloadData()
}

final class MainViewController: UIViewController {
    
    lazy var clearButton: UIButton = {
        
        let clearButton = UIButton(type: .custom)
        
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.setTitle("Очистить", for: .normal)
        clearButton.setTitleColor(.red, for: .normal)
        clearButton.tintColor = .red
        clearButton.layer.borderColor = UIColor.systemRed.cgColor
        clearButton.layer.borderWidth = 1
        clearButton.layer.cornerRadius = 15
        clearButton.isHidden = true
        
        clearButton.addTarget(
            self,
            action: #selector(clearButtonDidTaped),
            for: .touchUpInside
        )
        
        return clearButton
    }()
    
    lazy var sectionHeader: UILabel = {
        let headerLabel = UILabel()
        
        headerLabel.textColor = .black
        headerLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return headerLabel
    }()

    private var childsTableView: UITableView!
    private var presenter: MainViewPresenterProtocol!
    private var childsTableViewDataSource: ChildsTableViewDataSource!
    
    private var textFieldName: TextFieldWithTitle!
    private var textFieldAge: TextFieldWithTitle!
    private var childsHeaderView: ChildsHeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = MainViewPresenter(view: self)
        
        setupTable()
        setupSubViews()
        setupConstraints()
    }
}

//MARK: - Private functions

extension MainViewController {
    
    private func addSubviews(to view: UIView, with views: UIView...) {
        views.forEach {
            view.addSubview($0)
        }
    }
    
    private func setupSubViews() {
        view.backgroundColor = .white
        textFieldName = TextFieldWithTitle(with: "Name", for: .name)
        textFieldAge = TextFieldWithTitle(with: "Age", for: .age)
        childsHeaderView = ChildsHeaderView()
        childsHeaderView.addButton.addTarget(self, action: #selector(addButtonDidTaped), for: .touchUpInside)
        sectionHeader.text = "Персональные данные"
        
        addSubviews(
            to: view,
            with: sectionHeader, textFieldName, textFieldAge, childsHeaderView,
                childsTableView, clearButton
        )
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            sectionHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            sectionHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            sectionHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            sectionHeader.heightAnchor.constraint(equalToConstant: 60),
            
            textFieldName.topAnchor.constraint(equalTo: sectionHeader.bottomAnchor, constant: 10),
            textFieldName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textFieldName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textFieldName.heightAnchor.constraint(equalToConstant: 60),
            
            textFieldAge.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 10),
            textFieldAge.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textFieldAge.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textFieldAge.heightAnchor.constraint(equalToConstant: 60),
            
            childsHeaderView.topAnchor.constraint(equalTo: textFieldAge.bottomAnchor, constant: 10),
            childsHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            childsHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            childsHeaderView.heightAnchor.constraint(equalToConstant: 40),
            
            childsTableView.topAnchor.constraint(equalTo: childsHeaderView.bottomAnchor, constant: 10),
            childsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            childsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            childsTableView.bottomAnchor.constraint(equalTo: clearButton.topAnchor, constant: -20),
            
            clearButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            clearButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            clearButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    @objc private func addButtonDidTaped() {
        presenter.addButtonDidTaped()
    }
    
    @objc private func clearButtonDidTaped() {
        showAlert(message: "ЭВМ хочет удалить список, согласен?")
    }
    
    private func showAlert(message: String) {
        let alertController = UIAlertController(
            title: "Очистка списка детей",
            message: message,
            preferredStyle: .actionSheet
        )
        
        let actionDelete = UIAlertAction(title: "Удалить", style: .destructive) { _ in
            self.presenter.clearButtonDidTaped()
        }
        let actionCancel = UIAlertAction(title: "Отмена", style: .cancel)
        
        
        alertController.addAction(actionDelete)
        alertController.addAction(actionCancel)
        
        present(alertController, animated: true)
    }
    
    private func setupTable() {
        
        childsTableView = UITableView()
         
        childsTableView.register(
            ChildsTableViewCell.self,
            forCellReuseIdentifier: "childCell")
        
        childsTableViewDataSource = ChildsTableViewDataSource(
            with: self,
            and: presenter
        )
        
        childsTableView.rowHeight = 150
        childsTableView.dataSource = childsTableViewDataSource
        childsTableView.translatesAutoresizingMaskIntoConstraints = false
        childsTableView.allowsMultipleSelection = false
        childsTableView.allowsSelection = true
    }
}

//MARK: - MainViewControllerProtocol

extension MainViewController: MainViewControllerProtocol {
    
    func childDidAdd() {
        childsTableView.reloadData()
        clearButton.isHidden = false
    }
    
    func hideAddButton() {
        childsHeaderView.addButton.isHidden = true
        print(childsHeaderView.frame)
    }
    
    func childListDidClear() {
        childsHeaderView.addButton.isHidden = false
        clearButton.isHidden = true
        childsTableView.reloadData()
    }
    
    func reloadData() {
        childsTableView.reloadData()
    }
    
    func showAddButton() {
        childsHeaderView.addButton.isHidden = false
    }
}

