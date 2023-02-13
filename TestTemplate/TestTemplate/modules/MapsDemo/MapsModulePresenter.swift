//
//  MapsModulePresenter.swift
//  TestTemplate
//
//  Created by Sergio García Vargas on 13/02/23.
//

import UIKit
import MapKit

protocol MapsModulePresenterProtocol {
    func showLoading()
    func hideLoading()
    func presentError(error: Error)
    func presentNextScreen(navigationController: UINavigationController, view: UIViewController)
    func showMap(region: MKCoordinateRegion, annotation: MKPointAnnotation)
    //func modifyView(_ data: Data)
}

final class MapsModulePresenter {
    var view: MapsModuleViewProtocol?
    let decoder = JSONDecoder()
}

extension MapsModulePresenter: MapsModulePresenterProtocol {
    func showMap(region: MKCoordinateRegion, annotation: MKPointAnnotation) {
        view?.mapMyLocation(region: region, annotation: annotation)
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
