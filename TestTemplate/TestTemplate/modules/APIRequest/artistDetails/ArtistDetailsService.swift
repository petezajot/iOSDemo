//
//  ArtistDetailsService.swift
//  TestTemplate
//
//  Created by Sergio García Vargas on 10/02/23.
//

import Foundation

protocol ArtistDetailsServiceProtocol {
    func getArtistImage(_ request: URLRequest, _ output: @escaping(Data?, Error?) -> Void)
    func getArtistDetails(_ request: URLRequest, _ output: @escaping(Data?, Error?) -> Void)
}

class ArtistDetailsService: ArtistDetailsServiceProtocol {
    private var networkRequest = APIRequests()
    
    func getArtistImage(_ request: URLRequest, _ output: @escaping (Data?, Error?) -> Void) {
        networkRequest.networkRequest(request: request) { data, error in
            output(data, error)
        }
    }
    
    func getArtistDetails(_ request: URLRequest, _ output: @escaping (Data?, Error?) -> Void) {
        networkRequest.networkRequest(request: request) { data, error in
            output(data, error)
        }
    }
    
}

