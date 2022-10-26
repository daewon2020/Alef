//
//  MainViewController.swift
//  Alef
//
//  Created by Константин Андреев on 26.10.2022.
//

import UIKit

class MainViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let textFieldWithTitle = TextFieldWithTitle(with: "Name")
        
        view.backgroundColor = .white
        
        view.addSubview(textFieldWithTitle)
        
        textFieldWithTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textFieldWithTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            textFieldWithTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textFieldWithTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textFieldWithTitle.heightAnchor.constraint(equalToConstant: 60)
        ])
        
    }
    
    private func addSubviews(views: UIView...) {
        views.forEach {
            view.addSubview($0)
        }
    }
}
