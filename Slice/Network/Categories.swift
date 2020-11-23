//
//  CategoryModel.swift
//  Ecommerce
//
//  Created by Murali on 17/08/20.
//  Copyright © 2020 Murali. All rights reserved.
//

import Foundation

struct Categories:Codable {
    var data: [[Product]] = []
 
}

extension Categories: Fetchable {
    static var apiBase: String { return Constants.extURLComponent }
}

extension Categories: JSONINitializer{
    init(_ data: Data) {
        do {
            let list = try! JSONDecoder().decode(Categories.self, from: data)
            self.data = list.data
        }
    }
}
