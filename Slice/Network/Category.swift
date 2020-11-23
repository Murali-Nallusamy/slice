//
//  Category+CoreDataClass.swift
//  Ecommerce
//
//  Created by Murali on 18/08/20.
//  Copyright © 2020 Murali. All rights reserved.
//
//

import Foundation

struct Product: Codable{
    var voucherCode: String?
    var voucherDesc: String?
    var discountTitle: String?
    var discountDesc: String?
    var validTill: String?
    var isExpiringSoon: Bool?
    var discount: String?
    var seller: String?
    var shareData: String?
    
    func encode() -> Data? {
        return try? JSONEncoder().encode(self)
    }
}
