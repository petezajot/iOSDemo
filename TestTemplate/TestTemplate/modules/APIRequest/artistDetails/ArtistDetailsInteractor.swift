//
//  ArtistDetailsInteractor.swift
//  TestTemplate
//
//  Created by Sergio García Vargas on 10/02/23.
//

import Foundation
import UIKit

protocol ArtistDetailsInteractorProtocol {
    func setupView()
    func getArtistImage()
    func getArtistDetails()
}

final class ArtistDetailsInteractor {
    var service: ArtistDetailsServiceProtocol!//
    var presenter: ArtistDetailsPresenterProtocol?
    private var requestHelper = RequestHelper() //optional
    //Attributes from configurator & local attributes
    var artistId: String
    
    //Constructor
    init(artistId: String){
        self.artistId = artistId
    }
    /*service.example(request, paramOne) { data, error in
      presenter.modifyView(data)
     
               or
     
      presenter.presentError(error)
    }*/
}

extension ArtistDetailsInteractor: ArtistDetailsInteractorProtocol {
    func getArtistDetails() {
        let request = RequestHelper().configure(url: "/artists/\(artistId)", method: "GET")
        service.getArtistDetails(request) { data, error in
            if let err = error {
                self.presenter?.presentError(error: err)
            }
            self.presenter?.showArtistDetails(data: data!)
        }
    }
    
    func getArtistImage() {
        let request = RequestHelper().configureImagesServer(url: "/artists/\(artistId)", size: "200x200")
        service.getArtistImage(request) { data, error in
            if let err = error {
                self.presenter?.presentError(error: err)
            }
            self.presenter?.showArtistImage(data: data!)
        }
    }
    
    func setupView() {
        self.getArtistImage()
        self.getArtistDetails()
    }
}
