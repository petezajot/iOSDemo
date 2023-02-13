//
//  PortfolioMenuPresenter.swift
//  TestTemplate
//
//  Created by Sergio García Vargas on 11/02/23.
//

import UIKit

protocol PortfolioMenuPresenterProtocol {
    func showLoading()
    func hideLoading()
    func presentError(error: Error)
    func presentNextScreen(navigationController: UINavigationController, view: UIViewController)
}

final class PortfolioMenuPresenter {
    var view: PortfolioMenuViewProtocol?
    let decoder = JSONDecoder()
}

extension PortfolioMenuPresenter: PortfolioMenuPresenterProtocol {
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
