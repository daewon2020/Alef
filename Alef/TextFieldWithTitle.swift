//
//  TextFieldWithTitle.swift
//  Alef
//
//  Created by Константин Андреев on 26.10.2022.
//

import UIKit

class TextFieldWithTitle: UIView {

    lazy var textFieldHeaderLabel: UILabel = {
        let headerLabel = UILabel()
        
        headerLabel.textColor = .lightGray
        headerLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return headerLabel
    }()
    
    lazy var personDataTextField: UITextField = {
        let personDataTextField = UITextField()
        
        personDataTextField.translatesAutoresizingMaskIntoConstraints = false

        return personDataTextField
    }()
    
    lazy var persanalDataStackView: UIStackView = {
        let persanalDataStackView = UIStackView()
        persanalDataStackView.translatesAutoresizingMaskIntoConstraints = false
        persanalDataStackView.axis = .vertical
        persanalDataStackView.alignment = .fill
        persanalDataStackView.distribution = .fill
        persanalDataStackView.spacing = 2
        persanalDataStackView.layer.cornerRadius = 5
        persanalDataStackView.layer.borderWidth = 1
        persanalDataStackView.layer.borderColor = UIColor.lightGray.cgColor
        persanalDataStackView.isLayoutMarginsRelativeArrangement = true
        persanalDataStackView.layoutMargins = .init(top: 5, left: 10, bottom: 5, right: 10)
        return persanalDataStackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        print("UIView init")
    }
    
    init(with label: String) {
        
        super.init(frame: .zero)
        textFieldHeaderLabel.text = label
        persanalDataStackView.addArrangedSubview(textFieldHeaderLabel)
        persanalDataStackView.addArrangedSubview(personDataTextField)
        addSubview(persanalDataStackView)
        
        NSLayoutConstraint.activate([
            persanalDataStackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            persanalDataStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            persanalDataStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            persanalDataStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
}
