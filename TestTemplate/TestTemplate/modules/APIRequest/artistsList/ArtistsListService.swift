//
//  ArtistsListService.swift
//  TestTemplate
//
//  Created by Sergio García Vargas on 10/02/23.
//

import Foundation

protocol ArtistsListServiceProtocol {
    func getArtistsList(request: URLRequest, _ output: @escaping(Data?, Error?) -> Void)
}

class ArtistsListService: ArtistsListServiceProtocol {
    private var networkRequest = APIRequests()
    
    func getArtistsList(request: URLRequest, _ output: @escaping (Data?, Error?) -> Void) {
        networkRequest.networkRequest(request: request) { data, error in
            output(data, error)
        }
    }
}

