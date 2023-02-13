//
//  PortfolioMenuInteractor.swift
//  TestTemplate
//
//  Created by Sergio García Vargas on 11/02/23.
//

import Foundation
import UIKit

protocol PortfolioMenuInteractorProtocol {
    func setupView()
    func showApiRequestModule(navigationController: UINavigationController)
    func showMapsDemoModule(navigationController: UINavigationController)
}

final class PortfolioMenuInteractor {
    var service: PortfolioMenuServiceProtocol!//
    var presenter: PortfolioMenuPresenterProtocol?
    private var requestHelper = RequestHelper() //optional
    //Attributes from configurator & local attributes
    
    //Constructor
    init(){}
}

extension PortfolioMenuInteractor: PortfolioMenuInteractorProtocol {
    func showMapsDemoModule(navigationController: UINavigationController) {
        let mapsModule = MapsModuleViewController().configuredView()
        presenter?.presentNextScreen(navigationController: navigationController, view: mapsModule)
    }
    
    func showApiRequestModule(navigationController: UINavigationController) {
        let apiRequestModule = ArtistsListViewController().configuredView()
        presenter?.presentNextScreen(navigationController: navigationController, view: apiRequestModule)
    }
    
    func setupView() {}
}
