//
//  ArtistsListPresenter.swift
//  TestTemplate
//
//  Created by Sergio García Vargas on 10/02/23.
//

import UIKit

protocol ArtistsListPresenterProtocol {
    func showLoading()
    func hideLoading()
    func presentError(error: Error)
    func presentNextScreen(navigationController: UINavigationController, view: UIViewController)
    func showArtistsList(data: Data)
}

final class ArtistsListPresenter {
    var view: ArtistsListViewProtocol?
    let decoder = JSONDecoder()
}

extension ArtistsListPresenter: ArtistsListPresenterProtocol {
    func showArtistsList(data: Data) {
        do {
            let dataStruct = try decoder.decode(ArtistsListEntity.self, from: data)
            self.view?.showArtistsList(artistList: dataStruct)
        }catch {
            self.presentError(error: error)
        }
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
}
