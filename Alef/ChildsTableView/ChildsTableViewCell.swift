//
//  ChildesTableViewCell.swift
//  Alef
//
//  Created by Константин Андреев on 26.10.2022.
//

import UIKit

final class ChildsTableViewCell: UITableViewCell {

    private var textFieldName: TextFieldWithTitle!
    private var textFieldAge: TextFieldWithTitle!
    private var customView: UIView!
    
    var viewModel: ChildsTableViewCellModelProrocol! {
        didSet {
            setupCell()
        }
    }
    
    lazy var deleteButton: UIButton = {
        
        let deleteButton = UIButton(type: .custom)
        
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.setTitle("Удалить", for: .normal)
        deleteButton.setTitleColor(.red, for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteItem(sender:)), for: .touchUpInside)
        
        return deleteButton
    }()
    
    override func prepareForReuse() {
        
        contentView.subviews.forEach {
            $0.removeFromSuperview()
        }
    }
    
    func setupCell() {
        
        selectionStyle = .none

        textFieldName = TextFieldWithTitle(with: "Имя", for: .name)
        textFieldName.text = viewModel.name
        textFieldName.delegate = self
        textFieldName.tag = 0
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        
        textFieldAge = TextFieldWithTitle(with: "Возраст", for: .age)
        textFieldAge.text = viewModel.age == 0 ? "" : "\(viewModel.age)"
        textFieldAge.delegate = self
        textFieldAge.tag = 1
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(textFieldName)
        contentView.addSubview(textFieldAge)
        contentView.addSubview(deleteButton)

        setConstraints()
    }
}

//MARK: - private func

extension ChildsTableViewCell {
    @objc private func deleteItem(sender: UIButton) {
        viewModel.deleteButtonDidTapped(with: sender.tag)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            textFieldName.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            textFieldName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            textFieldName.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor, constant: 0),
            textFieldName.heightAnchor.constraint(equalToConstant: 60),
            
            deleteButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            deleteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            deleteButton.widthAnchor.constraint(equalToConstant: 100),
            deleteButton.heightAnchor.constraint(equalToConstant: 60),
            
            textFieldAge.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 10),
            textFieldAge.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            textFieldAge.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor, constant: 0),
            textFieldAge.heightAnchor.constraint(equalToConstant: 60),
            ]
        )
    }
}


//MARK: - UITextFieldDelegate

extension ChildsTableViewCell: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            viewModel.name = textField.text ?? ""
        case 1:
            viewModel.age = Int(textField.text ?? "") ?? 0
        default:
            break
        }
    }
}


