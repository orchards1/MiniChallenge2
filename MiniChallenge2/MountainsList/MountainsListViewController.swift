//
//  MountainsListViewController.swift
//  MiniChallenge2
//
//  Created by Marcel W on 12/07/19.
//  Copyright © 2019 Michael Louis. All rights reserved.
//

import UIKit

class MountainsListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var mountainCollectionView: UICollectionView!
    
    var arrayImage = [UIImage(named: "ic_onboarding_1"), UIImage(named: "ic_onboarding_2"), UIImage(named: "ic_onboarding_3"), UIImage(named: "ic_onboarding_4"), UIImage(named: "ic_onboarding_5")]
    var arrayMountainName = ["Mt. Semeru", "Mt. Gede", "Mt. Pangrango", "Mt. Suparman", "Mt. Sukirman"]
    var arrayLocation = ["East Java, Java Island", "Location, Island", "Location, Island", "Location, Island", "Location, Island"]
    var arrayAltitude = ["3676 mdpl", "0012 mdpl", "2312 mdpl", "1012 mdpl", "1921 mdpl"]
    
    var mountain = [Mountain]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mountainCollectionView.delegate = self
        mountainCollectionView.dataSource = self
        for i in 0..<arrayMountainName.count{
            let data = Mountain(mountainImg: arrayImage[i]!, name: arrayMountainName[i], location: arrayLocation[i], altitude: arrayAltitude[i])
            mountain.append(data)
        }
        setupNavBar()
        // Do any additional setup after loading the view.
    }
    
    func setupNavBar(){
        navigationController?.navigationBar.prefersLargeTitles = true
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mountain.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? MountainListCollectionViewCell
        
        cell?.imageMountain.image = mountain[indexPath.row].mountainImg
        cell?.nameLabel.text = mountain[indexPath.row].name
        cell?.locationLabel.text = mountain[indexPath.row].location
        cell?.heightLabel.text = mountain[indexPath.row].altitude
        
        return cell!
    }

}
