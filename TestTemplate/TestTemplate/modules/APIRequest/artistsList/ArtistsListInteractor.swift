//
//  ArtistsListInteractor.swift
//  TestTemplate
//
//  Created by Sergio García Vargas on 10/02/23.
//

import Foundation
import UIKit

protocol ArtistsListInteractorProtocol {
    func setupView()
    func showArtistDetailsScreen(navigationController: UINavigationController, artistId: String)
}

final class ArtistsListInteractor {
    var service: ArtistsListServiceProtocol!//
    var presenter: ArtistsListPresenterProtocol?
    private var requestHelper = RequestHelper()
    //Attributes from configurator & local attributes
    
    //Constructor
    init(){}
    /*service.example(request, paramOne) { data, error in
      presenter.modifyView(data)
     
               or
     
      presenter.presentError(error)
    }*/
}

extension ArtistsListInteractor: ArtistsListInteractorProtocol {
    func setupView() {
        self.getArtistList()
    }
    
    func getArtistList() {
        let request = requestHelper.configure(url: "/artists/top", method: "GET", "&limit=20&offset=20")
        service.getArtistsList(request: request) { data, error in
            if let err = error {
                self.presenter?.presentError(error: err)
            }
            self.presenter?.showArtistsList(data: data!)
        }
    }
    
    func showArtistDetailsScreen(navigationController: UINavigationController, artistId: String) {
        let artistDetailsView = ArtistDetailsViewController().configuredView(artistId: artistId)
        presenter?.presentNextScreen(navigationController: navigationController, view: artistDetailsView)
    }
}
