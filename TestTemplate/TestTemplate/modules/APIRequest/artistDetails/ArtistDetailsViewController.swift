//
//  ArtistDetailsViewController.swift
//  TestTemplate
//
//  Created by Sergio García Vargas on 10/02/23.
//

import UIKit

protocol ArtistDetailsViewProtocol {
    func presentError(error: Error)
    func getArtistImage(img: UIImage)
    func getArtistDetails(artistDetailsEntity: ArtistDetailsEntity)
}

class ArtistDetailsViewController: UIViewController {
    var interactor: ArtistDetailsInteractorProtocol?
    //Outlets & Attributes
    @IBOutlet weak var artistImage: UIImageView!
    @IBOutlet weak var labelBio: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor?.setupView()
    }
}

extension ArtistDetailsViewController: ArtistDetailsViewProtocol {
    func presentError(error: Error) {}
    func getArtistImage(img: UIImage) {
        DispatchQueue.main.async {
            self.artistImage.image = img
        }
    }
    
    func getArtistDetails(artistDetailsEntity: ArtistDetailsEntity) {
        let bio: String = artistDetailsEntity.artists?[0].bios?[0].bio ?? "Biography not available :("
        DispatchQueue.main.async {
            self.labelBio.text = bio
        }
    }
}
