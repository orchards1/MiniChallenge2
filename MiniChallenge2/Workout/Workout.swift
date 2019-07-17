//
//  Workout.swift
//  MiniChallenge2
//
//  Created by Mulyanti Lauw on 15/07/19.
//  Copyright © 2019 Michael Louis. All rights reserved.
//

import UIKit

class Workout: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Progress Bar Customization
        self.progressBar.tintColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        self.progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 3)
        self.progressBar.layer.cornerRadius = 1.5
        self.progressBar.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
