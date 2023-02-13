//
//  MapsModuleViewController.swift
//  TestTemplate
//
//  Created by Sergio García Vargas on 13/02/23.
//

import UIKit
import MapKit

protocol MapsModuleViewProtocol {
    func presentError(error: Error)
    func mapMyLocation(region: MKCoordinateRegion, annotation: MKPointAnnotation)
}

class MapsModuleViewController: UIViewController {
    var interactor: MapsModuleInteractorProtocol?
    //Outlets & Attributes
    @IBOutlet weak var mapsKit: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor?.setupView()
        interactor?.setupMap()
    }
}

extension MapsModuleViewController: MapsModuleViewProtocol {
    func mapMyLocation(region: MKCoordinateRegion, annotation: MKPointAnnotation) {
        mapsKit.setRegion(region, animated: true)
        mapsKit.addAnnotation(annotation)
    }
    
    func presentError(error: Error) {}
    
}
