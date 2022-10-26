//
//  TextFieldWithTitle.swift
//  Alef
//
//  Created by Константин Андреев on 26.10.2022.
//

import UIKit

final class TextFieldWithTitle: UIView {

    lazy var textFieldTitle: UILabel = {
        let textFieldTitle = UILabel()
        
        textFieldTitle.textColor = .lightGray
        textFieldTitle.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        textFieldTitle.translatesAutoresizingMaskIntoConstraints = false
        
        return textFieldTitle
    }()
    
    lazy var dataTextField: UITextField = {
        let dataTextField = UITextField()
        
        dataTextField.translatesAutoresizingMaskIntoConstraints = false
        if let title = textFieldTitle.text {
            dataTextField.placeholder = "Type your \(title) here..."
        } else {
            dataTextField.placeholder = "Type text here..."
        }
        
        
        return dataTextField
    }()
    
    lazy var textFieldStackView: UIStackView = {
        let textFieldStackView = UIStackView()
        textFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        textFieldStackView.axis = .vertical
        textFieldStackView.alignment = .fill
        textFieldStackView.distribution = .fill
        textFieldStackView.spacing = 2
        textFieldStackView.layer.cornerRadius = 5
        textFieldStackView.layer.borderWidth = 1
        textFieldStackView.layer.borderColor = UIColor.lightGray.cgColor
        textFieldStackView.isLayoutMarginsRelativeArrangement = true
        textFieldStackView.layoutMargins = .init(top: 5, left: 10, bottom: 5, right: 10)
        return textFieldStackView
    }()
    
    init(with title: String) {
        
        super.init(frame: .zero)
        
        textFieldTitle.text = title
        textFieldStackView.addArrangedSubview(textFieldTitle)
        textFieldStackView.addArrangedSubview(dataTextField)
        addSubview(textFieldStackView)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textFieldStackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            textFieldStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            textFieldStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            textFieldStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
}
