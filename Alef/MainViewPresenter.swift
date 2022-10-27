//
//  MainViewControllerPresenter.swift
//  Alef
//
//  Created by Константин Андреев on 26.10.2022.
//

import Foundation

protocol MainViewPresenterProtocol: AnyObject {
    func viewDidLoad()
    func addButtonDidTaped()
}

class MainViewPresenter: MainViewPresenterProtocol {
    private weak var view: MainViewControllerProtocol!
    
    init(view: MainViewControllerProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        
    }
    
    func addButtonDidTaped() {
        
    }
}
