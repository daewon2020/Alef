//
//  MainViewControllerPresenter.swift
//  Alef
//
//  Created by Константин Андреев on 26.10.2022.
//

import Foundation

protocol MainViewPresenterProtocol: AnyObject {
    func addButtonDidTaped()
    func clearButtonDidTaped()
    func deleteChildItem(at index: Int)
    func getChildsCount() -> Int
    func getChild(for indexPath: IndexPath) -> ChildsTableViewCellModelProrocol
}

final class MainViewPresenter: MainViewPresenterProtocol {
    
    private weak var view: MainViewControllerProtocol!
    private var mainViewModel: MainViewModel!
    
    init(view: MainViewControllerProtocol) {
        self.view = view
        mainViewModel = MainViewModel()
    }
    
    func getChildsCount() -> Int {
        mainViewModel.childs.count
    }
    
    func addButtonDidTaped() {
        if mainViewModel.childs.count < 5 {
            mainViewModel.childs.append(ChildsTableViewCellModel(name: "", age: 0, presenter: self))
            view.childDidAdd()
            if mainViewModel.childs.count == 5 {
                view.hideAddButton()
            }
        }
    }
    
    func clearButtonDidTaped() {
        mainViewModel.childs.removeAll()
        view.childListDidClear()
    }
    
    func getChild(for indexPath: IndexPath) -> ChildsTableViewCellModelProrocol {
        mainViewModel.childs[indexPath.row]
    }
    
    func deleteChildItem(at index: Int) {
        if mainViewModel.childs.count == 5 {
            view.showAddButton()
        }
        
        mainViewModel.childs.remove(at: index)
        if mainViewModel.childs.count == 0 {
            view.childListDidClear()
        } else {
            view.reloadData()
        }
    }
}
