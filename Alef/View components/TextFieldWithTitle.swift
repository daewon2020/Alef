//
//  TextFieldWithTitle.swift
//  Alef
//
//  Created by Константин Андреев on 26.10.2022.
//

import UIKit

final class TextFieldWithTitle: UITextField {
    
    lazy var textFieldTitle: UILabel = {
        let textFieldTitle = UILabel(frame: CGRect(x: 5, y: 5, width: 100, height: 15))
        
        textFieldTitle.textColor = .lightGray
        textFieldTitle.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return textFieldTitle
    }()
    
    init(with title: String) {
        
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        borderStyle = .roundedRect
    
        
        if let title = textFieldTitle.text {
            placeholder = "Напишите \(title)"
        } else {
            placeholder = "Напишите текст"
        }
        
        textFieldTitle.text = title
        addSubview(textFieldTitle)
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
