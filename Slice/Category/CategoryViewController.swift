//
//  CategoryViewController.swift
//  Ecommerce
//
//  Created by Murali on 17/08/20.
//  Copyright © 2020 Murali. All rights reserved.
//

import UIKit

protocol CategoryDisplayProtocol: DisplayLogicProtocol{
    func displayContent(categories: [[Product]])
}

class CategoryViewController: UIViewController {
    weak var coordinator: CategoryCoordinator?
    var interactor: CategoryInteractorProtocol?
    private var categories: [[Product]] = []

    @IBOutlet weak var categoryTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
        loadCategory()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setup() {
        let viewController = self
        let interactor = CategoryInteractor()
        let presenter = CategoryPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        self.setupTableView()
    }
    
    private func setupTableView() {
        categoryTableView.register(CategoryTableViewCell.nib(), forCellReuseIdentifier: CategoryTableViewCell.identifier)
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
        categoryTableView.tableFooterView = UIView()
    }
    
    private func loadCategory(){
        interactor?.fetchCategory()
    }
    
    private func title(forIndex: Int)->String{
        switch forIndex {
            case 0:
                return "Top offers"
            case 1:
                return "Recent offers"
            case 2:
                return "Popular offers"
            default:
                return ""
        }
    }

}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier, for: indexPath) as? CategoryTableViewCell  else {
            return UITableViewCell()
        }
        let products = categories[indexPath.row]
        cell.updateCollectionView(forProduct: products)
        cell.titleLabel.text = title(forIndex: indexPath.row)
        cell.delegate = self
        cell.backgroundColor = .white
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let product = categories[indexPath.section][indexPath.row]
//        coordinator?.productDidSelected(product)
//    }
}

extension CategoryViewController: CategoryDisplayProtocol {
    func displayContent(categories: [[Product]]) {
        self.categories = categories
        DispatchQueue.main.async { [weak self] in
            self?.categoryTableView.reloadData()
        }
    }
}

extension CategoryViewController: ProductDelegate{
    func didSelectItem(product: Product, categoryTitle: String) {
        coordinator?.productDidSelected(product, categoryTitle)
    }
}


