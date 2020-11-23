//
//  Network.swift
//  Ecommerce
//
//  Created by Murali on 17/08/20.
//  Copyright © 2020 Murali. All rights reserved.
//

import Foundation

protocol Fetchable {
    static var apiBase: String { get }
}

protocol JSONINitializer {
    init(_ data:Data)
}


struct Client {
    let session: URLSession
    let baseURL = URL(string: Constants.baseURLString)!
    init(session: URLSession) {
        self.session = session
    }
}

extension Client {
    
    func fetch<Model: Fetchable & JSONINitializer>(_: Model.Type,completion: @escaping (Result<Model, Error>) -> Void)
    {
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                DispatchQueue.main.async {
                    completion(.success(Model.init(data)))
                }
            }catch {
                let genericError = "Parsing Error"
                let error = NSError(domain:"", code:404, userInfo:[ NSLocalizedDescriptionKey: genericError]) as Error
                completion(.failure(error))
            }
        }
    }
}





