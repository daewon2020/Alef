//
//  ChildesTableViewCell.swift
//  Alef
//
//  Created by Константин Андреев on 26.10.2022.
//

import UIKit

class ChildesTableViewCell: UITableViewCell {

    var textFieldName: TextFieldWithTitle!
    var textFieldAge: TextFieldWithTitle!
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        print(selected)
//    }
//
    
    func setupCell() {
        
        //selectionStyle = .none
        
        textFieldName = TextFieldWithTitle(with: "Имя")
        textFieldAge = TextFieldWithTitle(with: "Возраст")
        textFieldAge.frame = CGRect(x: 0, y: 0, width: frame.width, height: 60)
        addSubview(textFieldAge)
        contentView.addSubview(textFieldName)
        contentView.addSubview(textFieldAge)
        setConstraints()
    }
    
    override func prepareForReuse() {
        print("prepareForReuse")
    }
    
//    override func prepareForReuse() {
//        subviews.forEach { $0.removeFromSuperview() }
//    }
//
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            textFieldName.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            textFieldName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            textFieldName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            textFieldName.heightAnchor.constraint(equalToConstant: 60),
            
            textFieldAge.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
            textFieldAge.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            textFieldAge.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            textFieldAge.heightAnchor.constraint(equalToConstant: 60),
            ]
        )
    }
}
