//
//  ChildsHeaderView.swift
//  Alef
//
//  Created by Константин Андреев on 26.10.2022.
//

import UIKit

final class ChildsHeaderView: UIStackView {

    private var countLabel: UILabel!
    var addButton: UIButton!
    
    init() {
        super.init(frame: .zero)
        setupStackView()
        countLabel = UILabel()
        countLabel.text = "Дети(макс. 5)"
        
        addButton = UIButton(type: .contactAdd)
        addButton.setTitle("Добваить ребенка", for: .normal)
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addButton.layer.borderColor = UIColor.systemBlue.cgColor
        addButton.layer.borderWidth = 1
        addButton.layer.cornerRadius = 15
        
        addArrangedSubview(countLabel)
        addArrangedSubview(addButton)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Private functions

extension ChildsHeaderView {
    
    private func setupStackView() {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .horizontal
        alignment = .fill
        distribution = .fill
        spacing = 2
    }
}
