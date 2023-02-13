//
//  File.swift
//  TestTemplate
//
//  Created by Sergio García Vargas on 10/02/23.
//

import Foundation

class RequestHelper{
    func configure(url: String, method: String, _ extraConfig: String = String()) -> URLRequest {
        let createUrl = "\(Constants.url)\(url)?apikey=\(Constants.apiKey)\(extraConfig)"
        let urlString = createUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        var request: URLRequest = URLRequest(url: URL(string: urlString!)!, timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = method
        return request
    }
    
    func configureImagesServer(url: String, size: String) -> URLRequest {
        let createUrl = "\(Constants.urlImages)\(url)/images/\(size).jpg"
        let urlString = createUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        var request: URLRequest = URLRequest(url: URL(string: urlString!)!, timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        return request
    }
}
