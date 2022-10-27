//
//  ChildsTableViewDataSource.swift
//  Alef
//
//  Created by Константин Андреев on 26.10.2022.
//

import Foundation
import UIKit

class ChildsTableViewDataSource: NSObject, UITableViewDataSource, UITextFieldDelegate {
    
    weak var presenter: MainViewPresenterProtocol!
    weak var parentView: MainViewControllerProtocol!
    
    init(with parentView: MainViewControllerProtocol, and presenter: MainViewPresenterProtocol) {
        self.parentView = parentView
        self.presenter = presenter
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "childCell",
            for: indexPath) as? ChildesTableViewCell else { return UITableViewCell() }
        cell.setupCell()
        
            cell.textFieldName.tag = indexPath.row + 10
            cell.textFieldName.delegate = self
            cell.textFieldAge.tag = indexPath.row + 11
            cell.textFieldAge.delegate = self
        cell.textFieldAge.addTarget(self, action: #selector(nameTextFieldTapped), for: .touchUpInside)
        
        return cell
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(textField.tag)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    @objc func nameTextFieldTapped() {
        print("nameTextFieldTapped")
    }
}
