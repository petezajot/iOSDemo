//
//  ArtistsListConfigurator.swift
//  TestTemplate
//
//  Created by Sergio García Vargas on 10/02/23.
//

import UIKit

extension ArtistsListViewController {
    func configuredView() -> UIViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "artistsListStoryboard") as! ArtistsListViewController
        
        let interactor = ArtistsListInteractor()
        let presenter = ArtistsListPresenter()
        let service = ArtistsListService()
        
        view.interactor = interactor
        interactor.presenter = presenter
        interactor.service = service
        presenter.view = view
        
        return view
    }
    
    var mainstoryboard: UIStoryboard {
        return UIStoryboard(name:"Main",bundle: Bundle.main)
    }
}
