//
//  MountainsListViewController.swift
//  MiniChallenge2
//
//  Created by Marcel W on 12/07/19.
//  Copyright © 2019 Michael Louis. All rights reserved.
//
import CoreData
import UIKit

class MountainsListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "test", sender: nil)
        
        
    }
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func searchBarIsEmpty() -> Bool
    {
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredMountain = mountains.filter({( mountain : Mountain) -> Bool in
            return mountain.name.lowercased().contains(searchText.lowercased())
        })
        
        mountainCollectionView.reloadData()
    }

    let mountainListCollectionViewCell = MountainListCollectionViewCell()
    @IBOutlet weak var mountainCollectionView: UICollectionView!
    
    var arrayImage = [UIImage(named: "gunung1"), UIImage(named: "gunung2"), UIImage(named: "gunung3"), UIImage(named: "gunung4"), UIImage(named: "gunung5") , UIImage(named: "gunung6")]
    var arrayMountainName = ["Bromo", "Gede", "Merapi", "Semeru", "Sumbing" , "Sundoro"]
    var arrayLocation = ["Pasuruan, East Java", "Cianjur Regency, West Java", "Boyolali Regency, Central Java", "Lumajang Regency, East Java", "Wonosobo Regency, Central Java" ,"Wonosobo Regency, Central Java"]
    var arrayAltitude = ["2329 mdpl", "2958 mdpl", "2930 mdpl", "3676 mdpl", "3371 mdpl","3136 mdpl"]
    
    var searchMountain = [String]()
    var filteredMountain = [Mountain]()
    var mountains = [Mountain]()
    
    
    let searchController = UISearchController(searchResultsController: nil)
    var resultsController = UICollectionViewController()
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        // Setup the Search Controller
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Mountains"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "DBMountain", in: context)
        super.viewDidLoad()
//        resultsController.collectionView.delegate = self
        mountainCollectionView.delegate = self
        mountainCollectionView.dataSource = self
        
        for i in 0..<arrayMountainName.count{
            let data = Mountain(mountainImg: arrayImage[i]!, name: arrayMountainName[i], location: arrayLocation[i], altitude: arrayAltitude[i])
            mountains.append(data)
        }
        setupNavBar()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("SEARCH: search query = \(searchText)")
    }
    func setupNavBar(){
        navigationController?.navigationBar.prefersLargeTitles = true
//        let searchController = UISearchController(searchResultsController: nil)
//        navigationItem.searchController = searchController
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering() {
            return filteredMountain.count
        }
        return mountains.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? MountainListCollectionViewCell
        
        let mountain: Mountain
        let shadowPath2 = UIBezierPath(rect: cell!.bounds)
        if isFiltering() {
            mountain = filteredMountain[indexPath.row]
        } else {
            mountain = mountains[indexPath.row]
        }
        
        cell?.imageMountain!.image = mountain.mountainImg
        cell?.imageMountain.layer.cornerRadius = 20
        cell?.nameLabel!.text = mountain.name
        cell?.locationLabel!.text = mountain.location
        cell?.heightLabel!.text = mountain.altitude

        cell?.layer.masksToBounds = false
        cell?.layer.shadowColor = UIColor.black.cgColor
        cell?.layer.shadowOffset = CGSize(width: CGFloat(1.0), height: CGFloat(3.0))
        cell?.layer.shadowOpacity = 0.5
        cell?.layer.shadowPath = shadowPath2.cgPath
        return cell!
    }

}
extension MountainsListViewController: UISearchResultsUpdating {
    // MARK: - UISearchResultsUpdating Delegate
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

extension MountainsListViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
    }
}


