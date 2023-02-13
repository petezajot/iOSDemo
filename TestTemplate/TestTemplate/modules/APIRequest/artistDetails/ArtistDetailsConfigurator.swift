//
//  ArtistDetailsConfigurator.swift
//  TestTemplate
//
//  Created by Sergio García Vargas on 10/02/23.
//

import UIKit

extension ArtistDetailsViewController {
    func configuredView(artistId: String) -> UIViewController {
        let view = mainstoryboard.instantiateViewController(withIdentifier: "artistDetailsStoryboard") as! ArtistDetailsViewController
        
        let interactor = ArtistDetailsInteractor(artistId: artistId)
        let presenter = ArtistDetailsPresenter()
        let service = ArtistDetailsService()
        
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
