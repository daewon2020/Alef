//
//  ChildView.swift
//  Alef
//
//  Created by Константин Андреев on 27.10.2022.
//

import UIKit

class ChildView: UIStackView {
    private var countLabel: UILabel!
    var deleteButton: UIButton!

    init() {
        super.init(frame: .zero)
        setupStackView()
        
        let horizintalStackView = UIStackView()
        horizintalStackView.axis = .vertical
        horizintalStackView.alignment = .fill
        horizintalStackView.distribution = .fill
        
        deleteButton = UIButton(type: .contactAdd)
        deleteButton.setTitle("Удалить", for: .normal)
        deleteButton.setImage(UIImage(systemName: "plus"), for: .normal)
        
        horizintalStackView.addArrangedSubview(TextFieldWithTitle(with: "Имя"))
        horizintalStackView.addArrangedSubview(TextFieldWithTitle(with: "Возраст"))
        addArrangedSubview(horizintalStackView)
        addArrangedSubview(deleteButton)
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Private functions

extension ChildView {
    
    private func setupStackView() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        alignment = .fill
        distribution = .fill
        spacing = 2
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 5, left: 10, bottom: 5, right: 10)
    }
}

