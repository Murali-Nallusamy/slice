//
//  CategoryPresenter.swift
//  Ecommerce
//
//  Created by Murali on 17/08/20.
//  Copyright © 2020 Murali. All rights reserved.
//

import Foundation

protocol ErrorPresenter: class {
    func showError(_ error:Error)
}

protocol LoaderPresenter {
    func showLoading()
    func stopLoading()
}

typealias Presenter = ErrorPresenter & LoaderPresenter

protocol CategoryPresenterProtocol:Presenter {
    func showCategory(_ categories:[[Product]])
}


class CategoryPresenter:CategoryPresenterProtocol {
    weak var viewController: CategoryDisplayProtocol?

    func showCategory(_ categories: [[Product]]) {
        viewController?.displayContent(categories: categories)
    }

    func showError(_ error: Error) {
        viewController?.displayError(message: error)
    }
    
    func showLoading() {
        viewController?.displayLoading()
    }
    
    func stopLoading() {
        viewController?.removeLoading()
    }
    
    
}
