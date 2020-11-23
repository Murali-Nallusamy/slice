//
//  ProductDetailViewController.swift
//  Ecommerce
//
//  Created by Murali on 19/08/20.
//  Copyright © 2020 Murali. All rights reserved.
//

import UIKit
protocol ProductDetailDisplayProtocol: DisplayLogicProtocol {
    func showProductDetail(_ product:Product)
}

class ProductDetailViewController: UIViewController {
    weak var coordinator: ProductDetailCoordinator?
    @IBOutlet weak var copyCode: UIButton!
    @IBOutlet weak var share: UIButton!
    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var productIcon: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var shortMessage: UILabel!
    @IBOutlet weak var vocherCodeLabel: UILabel!
    @IBOutlet weak var voucherMessage: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var expiredIcon: UIImageView!
    @IBOutlet weak var backGroundImage: UIImageView!
    
    var interactor: ProductDetailInteractorProtocol?
    var product: Product!
    var titleString: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
        interactor?.injectProduct(product)
        interactor?.fetchProduct()
    }
    
    private func setup() {
        let viewController = self
        let interactor = ProductDetailInteractor()
        let presenter = ProductDetailPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    func updateUI(){
        categoryName.text = titleString
        expiredIcon.isHidden = !(product.isExpiringSoon ?? false)
        priceLabel.text = product.discount
        shortMessage.text = product.discountDesc
        if let seller = product.seller?.lowercased() {
            if seller == "swiggy"{
                productIcon.image = #imageLiteral(resourceName: "SwiggyIcon")
                let randomInt = Int.random(in: 0...1)
                backGroundImage.image = randomInt == 0 ?  #imageLiteral(resourceName: "swiggy2") : #imageLiteral(resourceName: "swiggy1")
            }else {
                productIcon.image = #imageLiteral(resourceName: "BookMyShowIcon")
                backGroundImage.image = #imageLiteral(resourceName: "BookMyShow")
            }
        }
        vocherCodeLabel.text = product.voucherCode
        voucherMessage.text = product.voucherDesc
        dateLabel.text = product.validTill
    }

    @IBAction func share(_ sender: UIButton) {
        interactor?.share()
        let shareText = product.shareData
        let vc = UIActivityViewController(activityItems: [shareText], applicationActivities: [])
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func copyVoucher(_ sender: Any) {
        interactor?.copyVoucher()
        let pasteboard = UIPasteboard.general
        pasteboard.string = product.voucherCode
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension ProductDetailViewController: ProductDetailDisplayProtocol {
    func showProductDetail(_ product:Product) {
        self.product = product
        updateUI()
    }
}
