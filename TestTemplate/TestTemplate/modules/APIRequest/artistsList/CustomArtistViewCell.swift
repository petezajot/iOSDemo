//
//  CustomArtistViewCell.swift
//  TestTemplate
//
//  Created by Sergio García Vargas on 10/02/23.
//

import UIKit

class CustomArtistViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    
    var results: ArtistsInfo? {
        didSet {
            self.name.text = results?.name
        }
    }
    
}
