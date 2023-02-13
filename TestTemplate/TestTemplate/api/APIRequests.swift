//
//  APIRequests.swift
//  TestTemplate
//
//  Created by Sergio García Vargas on 10/02/23.
//

import Foundation

class APIRequests {
    func networkRequest(request: URLRequest, _ output: @escaping(Data?, Error?) -> Void) {
        URLSession.shared.dataTask(with: request) { data, response, error in
            output(data, error)
        }.resume()
    }
}
