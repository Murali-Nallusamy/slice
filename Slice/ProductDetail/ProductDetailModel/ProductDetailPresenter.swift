//
//  ProductDetailPresenter.swift
//  Ecommerce
//
//  Created by Murali on 19/08/20.
//  Copyright © 2020 Murali. All rights reserved.
//

import Foundation

protocol ProductDetailPresenterProtocol:ErrorPresenter {
    func showProductDetail(_ forProduct :Product)
    func shared()
    func copied()
}


class ProductDetailPresenter: ProductDetailPresenterProtocol {
    weak var viewController: ProductDetailDisplayProtocol?

    func showError(_ error: Error) {
        viewController?.displayError(message: error)
    }

    func showProductDetail(_ forProduct :Product) {
        viewController?.showProductDetail(forProduct)
    }

    func shared() {
        viewController?.displaySuccessMessage(message: "Shared Successfully")
    }

    func copied() {
        viewController?.displaySuccessMessage(message: "Copied Voucher Code")
    }
}
