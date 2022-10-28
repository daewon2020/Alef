//
//  ChildsTableViewDataSource.swift
//  Alef
//
//  Created by Константин Андреев on 26.10.2022.
//

import UIKit

final class ChildsTableViewDataSource: NSObject, UITableViewDataSource, UITextFieldDelegate {
    
    weak var presenter: MainViewPresenterProtocol!
    weak var parentView: MainViewControllerProtocol!
    
    init(with parentView: MainViewControllerProtocol, and presenter: MainViewPresenterProtocol) {
        self.parentView = parentView
        self.presenter = presenter
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.getChildsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "childCell",
            for: indexPath) as? ChildsTableViewCell else { return UITableViewCell() }
        
        cell.viewModel = presenter.getChild(for: indexPath)
        cell.deleteButton.tag = indexPath.row
        
        return cell
    }
}
