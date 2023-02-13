//
//  ArtistsListEntity.swift
//  TestTemplate
//
//  Created by Sergio García Vargas on 10/02/23.
//

import Foundation

struct ArtistsListEntity: Codable {
    var artists: [ArtistsInfo]?
}

struct ArtistsInfo: Codable {
    var type: String?
    var id: String?
    var name: String?
}
