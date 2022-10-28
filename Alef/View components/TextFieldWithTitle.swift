//
//  TextFieldWithTitle.swift
//  Alef
//
//  Created by Константин Андреев on 26.10.2022.
//

import UIKit

enum TextFieldKind {
    case name
    case age
}

final class TextFieldWithTitle: UITextField {
    
    lazy var textFieldTitle: UILabel = {
        let textFieldTitle = UILabel(frame: CGRect(x: 12, y: 5, width: 100, height: 15))
        
        textFieldTitle.textColor = .lightGray
        textFieldTitle.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        
        return textFieldTitle
    }()
    
    init(with title: String, for type: TextFieldKind) {
        
        super.init(frame: .zero)
        
        switch type {
        case .name:
            self.keyboardType = .default
        case .age:
            self.keyboardType = .numberPad
            
        }
        
        textFieldTitle.text = title
        placeholder = "Напишите \(title)"
        addSubview(textFieldTitle)
        
        setupTextField()
        
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        super.editingRect(forBounds: bounds.inset(
            by: UIEdgeInsets.init(top: 25, left: 5, bottom: 5, right: 5))
        )
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        super.editingRect(forBounds: bounds.inset(
            by: UIEdgeInsets.init(top: 25, left: 5, bottom: 5, right: 5))
        )
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Private functions

extension TextFieldWithTitle {
   
    private func setupTextField() {
        
        translatesAutoresizingMaskIntoConstraints = false
        borderStyle = .roundedRect
        autocorrectionType = .no
        smartDashesType = .no
        smartInsertDeleteType = .no
        smartInsertDeleteType = .no
    }
}


