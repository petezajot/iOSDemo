//
//  PortfolioMenuViewController.swift
//  TestTemplate
//
//  Created by Sergio García Vargas on 11/02/23.
//

import UIKit

protocol PortfolioMenuViewProtocol {
    func presentError(error: Error)
}

class PortfolioMenuViewController: UIViewController {
    var interactor: PortfolioMenuInteractorProtocol?
    //Outlets & Attributes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor?.setupView()
    }
    
    @IBAction func presentApiRequestScreen(_ sender: Any) {
        interactor?.showApiRequestModule(navigationController: navigationController!)
    }
    
    @IBAction func presentMapsScreen(_ sender: Any) {
        interactor?.showMapsDemoModule(navigationController: navigationController!)
    }
    
}

extension PortfolioMenuViewController: PortfolioMenuViewProtocol {
    func presentError(error: Error) {}
    
}
