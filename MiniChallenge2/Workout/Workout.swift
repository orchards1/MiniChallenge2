//
//  Workout.swift
//  MiniChallenge2
//
//  Created by Mulyanti Lauw on 15/07/19.
//  Copyright © 2019 Michael Louis. All rights reserved.
//

import UIKit

class Workout: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var workoutCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Progress Bar Customization
        self.progressBar.tintColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        self.progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 3)
        self.progressBar.layer.cornerRadius = 1.5
        self.progressBar.clipsToBounds = true
        
        
        // Collection View Cell (Days Icon)
        workoutCollectionView.delegate = self
        workoutCollectionView.dataSource = self
        
        workoutCollectionView.register(WorkoutCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.width / 5, height: collectionView.frame.height / 4.5)
        return CGSize(width: 50, height: 50)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! WorkoutCollectionViewCell
        cell.daysIcon.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        return cell
    }

}
