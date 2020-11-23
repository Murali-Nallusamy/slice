//
//  ProductDetailCoordinator.swift
//  Ecommerce
//
//  Created by Murali on 19/08/20.
//  Copyright © 2020 Murali. All rights reserved.
//

import UIKit
//protocol ProductCoordinatorDelegate: AnyObject {
//    func productCoordinatorDidSelected(id:Int64,coordinator: ProductCoordinator)
//}

class ProductDetailCoordinator: Coordinator {
//    weak var delegate: ProductCoordinatorDelegate?
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    private var product: Product!
    private var categoryTitle: String!
    let productDetailViewController = ProductDetailViewController.storyboardViewController()

    init(product: Product, title:String, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.product = product
        self.categoryTitle = title
    }

    deinit {
        print("dealloc \(self)")
    }

    func start() {
        productDetailViewController.coordinator = self
        productDetailViewController.product = product
        productDetailViewController.titleString = categoryTitle
        navigationController.pushViewController(productDetailViewController, animated: true)
    }
}

//extension ProductCoordinator {
//    func productDidSelected (_ forProductID:Int64){
//        delegate?.productCoordinatorDidSelected(id: forProductID, coordinator: self)
//    }
//}

