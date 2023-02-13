//
//  ArtistsListViewController.swift
//  TestTemplate
//
//  Created by Sergio García Vargas on 10/02/23.
//

import UIKit

protocol ArtistsListViewProtocol {
    func presentError(error: Error)
    func showArtistsList(artistList: ArtistsListEntity)
}

class ArtistsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    var interactor: ArtistsListInteractorProtocol?
    var artists: [ArtistsInfo] = [ArtistsInfo]()
    @IBOutlet weak var uiTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor?.setupView()
        
        let fieldTextCell = UINib(nibName: "CustomArtistViewCell", bundle: nil)
        uiTable.register(fieldTextCell, forCellReuseIdentifier: "CustomArtistViewCell")
        uiTable.delegate = self
        uiTable.dataSource = self
    }
}

extension ArtistsListViewController: ArtistsListViewProtocol {
    func showArtistsList(artistList: ArtistsListEntity) {
        setupTableData(artistList: artistList)
    }
    
    func presentError(error: Error) {
        print("ERROR: \(error.localizedDescription)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomArtistViewCell", for: indexPath) as? CustomArtistViewCell
        cell?.results = artists[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let artistId: String = artists[indexPath.row].id ?? String()
        interactor?.showArtistDetailsScreen(navigationController: navigationController!, artistId: artistId)
    }
    
    fileprivate func setupTableData(artistList: ArtistsListEntity) {
        DispatchQueue.main.async {
            artistList.artists?.forEach { i in
                self.artists.append(i)
            }
            self.uiTable.reloadData()
        }
    }
}
