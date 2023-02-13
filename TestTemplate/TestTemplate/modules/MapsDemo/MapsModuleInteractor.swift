//
//  MapsModuleInteractor.swift
//  TestTemplate
//
//  Created by Sergio García Vargas on 13/02/23.
//

import Foundation
import UIKit
import MapKit
import CoreLocation

protocol MapsModuleInteractorProtocol {
    func setupView()
    func setupMap()
}

final class MapsModuleInteractor {
    var service: MapsModuleServiceProtocol!//
    var presenter: MapsModulePresenterProtocol?
    //Attributes from configurator & local attributes
    
    //Constructor
    init(presenter: MapsModulePresenterProtocol, service: MapsModuleServiceProtocol) {
        self.presenter = presenter
        self.service = service
    }
    /*service.example(request, paramOne) { data, error in
      presenter.modifyView(data)
     
               or
     
      presenter.presentError(error)
    }*/
}

extension MapsModuleInteractor: MapsModuleInteractorProtocol {
    func setupMap() {
        let currentLocation = getMyCurrentLocation()
        let lat: CLLocationDegrees = currentLocation.coordinate.latitude
        let lon: CLLocationDegrees = currentLocation.coordinate.longitude
        
        let coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        //span
        let latDelta: CLLocationDegrees = 0.2
        let lonDelta: CLLocationDegrees = 0.2
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        //region
        let region: MKCoordinateRegion = MKCoordinateRegion(center: coordinate, span: span)
        
        //annotation
        let annotation: MKPointAnnotation = MKPointAnnotation()
        annotation.title = "Hola!"
        annotation.subtitle = "Usted está aquí!"
        annotation.coordinate = coordinate
        
        presenter?.showMap(region: region, annotation: annotation)
    }
    
    fileprivate func getMyCurrentLocation() -> CLLocation {
        let locManager = CLLocationManager()
        locManager.requestAlwaysAuthorization()
        
        var currentLocation: CLLocation?
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == .authorizedAlways {
            currentLocation = locManager.location
        }
        let tajLat: CLLocationDegrees = -39.849254
        let tajLong: CLLocationDegrees = -71.994215
        return currentLocation ?? CLLocation(latitude: tajLat, longitude: tajLong)
    }
    
    func setupView() {}
}
