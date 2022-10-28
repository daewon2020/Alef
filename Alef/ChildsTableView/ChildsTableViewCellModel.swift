//
//  ChildsTableViewCellModel.swift
//  Alef
//
//  Created by Константин Андреев on 27.10.2022.
//

protocol ChildsTableViewCellModelProrocol: AnyObject {
    
    var name: String { get set }
    var age: Int { get set }
    func deleteButtonDidTapped(with index: Int)
}

final class ChildsTableViewCellModel: ChildsTableViewCellModelProrocol {
    
    var name: String
    var age: Int
    var presenter: MainViewPresenterProtocol!
    
    init(name: String, age: Int, presenter: MainViewPresenterProtocol) {
        self.name = name
        self.age = age
        self.presenter = presenter
    }
    
    func deleteButtonDidTapped(with index: Int) {
        
        presenter.deleteChildItem(at: index)
    }
}
