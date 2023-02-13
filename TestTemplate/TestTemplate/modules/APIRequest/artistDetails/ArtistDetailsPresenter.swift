//
//  ArtistDetailsPresenter.swift
//  TestTemplate
//
//  Created by Sergio García Vargas on 10/02/23.
//

import UIKit

protocol ArtistDetailsPresenterProtocol {
    func showLoading()
    func hideLoading()
    func presentError(error: Error)
    func presentNextScreen(navigationController: UINavigationController, view: UIViewController)
    func showArtistImage(data: Data)
    func showArtistDetails(data: Data)
}

final class ArtistDetailsPresenter {
    var view: ArtistDetailsViewProtocol?
    let decoder = JSONDecoder()
}

extension ArtistDetailsPresenter: ArtistDetailsPresenterProtocol {
    func showArtistDetails(data: Data) {
        do {
            let artistDetailsEntity = try decoder.decode(ArtistDetailsEntity.self, from: data)
            view?.getArtistDetails(artistDetailsEntity: artistDetailsEntity)
        }catch{
            self.presentError(error: error)
        }
    }
    
    func showArtistImage(data: Data) {
        let img = UIImage(data: data)
        view?.getArtistImage(img: img!)
    }
    
    func showLoading() {
        //view.showLoading()
    }
    
    func hideLoading() {
        //view.dismissLoading()
    }
    
    func presentError(error: Error) {
        view?.presentError(error: error)
        //hideLoading()
    }
    
    func presentNextScreen(navigationController: UINavigationController, view: UIViewController) {
        navigationController.pushViewController(view, animated: true)
    }
    
    /*func modifyView(_ data: Data) {
     let decoder = JSONDecoder()
     let dataStruct = try decoder.decode(Entity.self, from: data)
     view.modifyView(entity: dataStruct)
     }*/
}
