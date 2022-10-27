//
//  MainViewController.swift
//  Alef
//
//  Created by Константин Андреев on 26.10.2022.
//

import UIKit

protocol MainViewControllerProtocol: AnyObject {
    
}

final class MainViewController: UIViewController, UITableViewDelegate {
    
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
        
        childsTableView = UITableView()
        childsTableView.delegate = self
        
        childsTableView.register(
            ChildesTableViewCell.self,
            forCellReuseIdentifier: "childCell")
        
        childsTableViewDataSource = ChildsTableViewDataSource(
            with: self,
            and: presenter
        )
        
        childsTableView.rowHeight = 150
        
        childsTableView.dataSource = childsTableViewDataSource
        childsTableView.translatesAutoresizingMaskIntoConstraints = false
        childsTableView.selectionFollowsFocus = true
        childsTableView.allowsMultipleSelection = false
        childsTableView.allowsFocus = true
        childsTableView.allowsSelection = false
        
        setupSubViews()
        setupConstraints()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}

//MARK: - Private functions

extension MainViewController {
    
    private func addSubviews(to stackView: UIStackView, with views: UIView...) {
        views.forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    private func setupSubViews() {
        view.backgroundColor = .white
        textFieldName = TextFieldWithTitle(with: "Name")
        textFieldAge = TextFieldWithTitle(with: "Age")
        childsHeaderView = ChildsHeaderView()
        sectionHeader.text = "Персональные данные"
        
        view.addSubview(sectionHeader)
        view.addSubview(textFieldName)
        view.addSubview(textFieldAge)
        view.addSubview(childsHeaderView)
        view.addSubview(childsTableView)
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
            childsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
            
        ])
    }
}

//MARK: - MainViewControllerProtocol

extension MainViewController: MainViewControllerProtocol {
    
}

