//
//  CategoryWorker.swift
//  Ecommerce
//
//  Created by Murali on 19/08/20.
//  Copyright © 2020 Murali. All rights reserved.
//

import Foundation
import CoreData

protocol WorkerProtocol {
    associatedtype Model
    func fetch(completion:@escaping (Result<Model, Error>) -> Void)
}

class CategoryWorker: WorkerProtocol{
    typealias Model = Categories

    func fetch(completion:@escaping (Result<Categories, Error>) -> Void) {
        let client = Client(session: URLSession.shared)
        client.fetch(Categories.self) { (result) in
            completion(result)
        }
    }
}
