//
//  ArtistDetailsEntity.swift
//  TestTemplate
//
//  Created by Sergio García Vargas on 10/02/23.
//

import Foundation

struct ArtistDetailsEntity: Codable {
    var artists: [ArtistsDetails]?
}

struct ArtistsDetails: Codable {
    var name: String?
    var bios: [Bios]?
}

struct Bios: Codable {
    var title: String?
    var author: String?
    var bio: String?
}
