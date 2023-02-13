//
//  MapsModuleConfigurator.swift
//  TestTemplate
//
//  Created by Sergio García Vargas on 13/02/23.
//

import UIKit

extension MapsModuleViewController {
    func configuredView() -> UIViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "mapsModuleStoryboard") as! MapsModuleViewController
        
        let presenter = MapsModulePresenter()
        let service = MapsModuleService()
        let interactor = MapsModuleInteractor(presenter: presenter, service: service)
        
        view.interactor = interactor
        interactor.presenter = presenter
        interactor.service = service
        presenter.view = view
        
        return view
    }
    
    var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"MapsModule",bundle: Bundle.main)
    }
}
