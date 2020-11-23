//
//  CategoryInteractor.swift
//  Ecommerce
//
//  Created by Murali on 17/08/20.
//  Copyright © 2020 Murali. All rights reserved.
//
import Foundation

protocol CategoryInteractorProtocol {
    func fetchCategory()
}

class  CategoryInteractor: CategoryInteractorProtocol {
    var presenter: CategoryPresenterProtocol?
    private var categories: [[Product]] = []

    func fetchCategory() {
        presenter?.showLoading()
        CategoryWorker.init().fetch (completion:{ [unowned self] result in
            self.presenter?.stopLoading()
            switch result {
            case .failure( let error):
                self.presenter?.showError(error)
            case .success(let response):
                self.presenter?.showCategory(response.data)
            }
        })
    }
}


