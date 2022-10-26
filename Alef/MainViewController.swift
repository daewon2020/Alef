//
//  MainViewController.swift
//  Alef
//
//  Created by Константин Андреев on 26.10.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    lazy var personSectionStackView: UIStackView = {
        let persanalDataStackView = UIStackView()
        persanalDataStackView.translatesAutoresizingMaskIntoConstraints = false
        persanalDataStackView.axis = .vertical
        persanalDataStackView.alignment = .fill
        persanalDataStackView.distribution = .fillEqually
        persanalDataStackView.spacing = 6
        persanalDataStackView.layer.borderColor = UIColor.lightGray.cgColor
        persanalDataStackView.isLayoutMarginsRelativeArrangement = true
        return persanalDataStackView
    }()
    
    lazy var sectionHeader: UILabel = {
        let headerLabel = UILabel()
        
        headerLabel.textColor = .black
        headerLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return headerLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textFieldName = TextFieldWithTitle(with: "Name")
        let textFieldAge = TextFieldWithTitle(with: "Age")
        sectionHeader.text = "Персональные данные"
        
        view.backgroundColor = .white
        view.addSubview(personSectionStackView)
        
        addSubviews(to: personSectionStackView, with: sectionHeader, textFieldName,textFieldAge)
        setupConstraints()
    }
}

//MARK: - Private functions

extension MainViewController {
    
    private func addSubviews(to stackView: UIStackView, with views: UIView...) {
        views.forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            personSectionStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            personSectionStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            personSectionStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            personSectionStackView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}
