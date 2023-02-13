//
//  PortfolioMenuConfigurator.swift
//  TestTemplate
//
//  Created by Sergio García Vargas on 11/02/23.
//

import UIKit

extension PortfolioMenuViewController {
    func configuredView() -> UIViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "portfolioMenuStoryboard") as! PortfolioMenuViewController
        
        let interactor = PortfolioMenuInteractor()
        let presenter = PortfolioMenuPresenter()
        let service = PortfolioMenuService()
        
        view.interactor = interactor
        interactor.presenter = presenter
        interactor.service = service
        presenter.view = view
        
        return view
    }
    
    var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"Index",bundle: Bundle.main)
    }
}
