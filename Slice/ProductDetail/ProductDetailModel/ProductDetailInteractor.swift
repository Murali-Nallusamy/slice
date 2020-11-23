//
//  ProductDetailInteractor.swift
//  Ecommerce
//
//  Created by Murali on 19/08/20.
//  Copyright © 2020 Murali. All rights reserved.
//

import Foundation

protocol ProductDetailInteractorProtocol {
    func injectProduct(_ product:Product)
    func fetchProduct() // id
    func share()
    func copyVoucher()
}

class  ProductDetailInteractor: ProductDetailInteractorProtocol {
    var presenter: ProductDetailPresenter?
    private var product: Product!
    
    func injectProduct(_ product:Product) {
        self.product = product
    }

    func fetchProduct() {
        presenter?.showProductDetail(product)
    }

    func copyVoucher(){
        presenter?.copied()
    }

    func share() {
        presenter?.shared()
    }
    
}
