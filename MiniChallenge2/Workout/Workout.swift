//
//  Workout.swift
//  MiniChallenge2
//
//  Created by Mulyanti Lauw on 15/07/19.
//  Copyright © 2019 Michael Louis. All rights reserved.
//

import UIKit
import HealthKit

class Workout: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //        return CGSize(width: collectionView.frame.width / 5, height: collectionView.frame.height / 4.5)
        return CGSize(width: 50, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! WorkoutCollectionViewCell
        
        if (indexPath.row < 3 || indexPath.row > 16) {
            cell.daysIcon.backgroundColor = .clear
        } else {
            cell.daysIcon.image = UIImage(named: "\(indexPath.row - 2)inactive")
            
        }
        return cell
    }

    @IBAction func refreshButtonDidTap(_ sender: Any) {
        fire()
    }
    @IBOutlet weak var kkalLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var workoutCollectionView: UICollectionView!
    @IBOutlet weak var workoutTableView: UITableView!
    let healthManager = HKHealthStore()
    var counts = 0.0
    var counts2 = 0.0
    var Kkal:Double = 0.0
    var activities = [Activities]()
    var today = Calendar.current
    var step: HKQuantityType? = HKObjectType.quantityType(forIdentifier: .stepCount)
    @objc func fire()
    {
        let earlyDate = today.startOfDay(for: Date())
        fetchHeartRates(endTime: NSDate(), startTime: earlyDate as NSDate)
    }
    
    override func viewDidLoad() {        UserDefaults.standard.set(true, forKey: "sudahmilih")
                super.viewDidLoad()
        fire()
        var arrayActivityName = ["Olahraga1","Olahraga2","Olahraga3"]
        var arraycurrent = [0,0,0]
        var arraymax = [20,20,20]
        for i in 0..<arrayActivityName.count{
            let data = Activities(name: arrayActivityName[i], current: arraycurrent[i], max: arraymax[0])
            activities.append(data)
        }
        
        
        
        // Progress Bar Customization
        self.progressBar.tintColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        self.progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 3)
        self.progressBar.layer.cornerRadius = 1.5
        self.progressBar.clipsToBounds = true
        
        
        // Collection View Cell (Days Icon)
        workoutCollectionView.delegate = self
        workoutCollectionView.dataSource = self
        workoutCollectionView.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        workoutCollectionView.register(WorkoutCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        
        // Table View Cell
        workoutTableView.delegate = self
        workoutTableView.dataSource = self
        workoutTableView.register(WorkoutTableViewCell.self, forCellReuseIdentifier: "tableCell")
    }
    class func authorizeHealthKit(completion: @escaping (Bool, Error?) -> Swift.Void) {
        
    }


    func fetchHeartRates(endTime: NSDate, startTime: NSDate){
        counts = 0.0
        guard let sampleType = HKObjectType.quantityType(forIdentifier: .activeEnergyBurned) else { return }
        let predicate = HKQuery.predicateForSamples(withStart: startTime as Date, end: endTime as Date, options: [])
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        let query = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: 10000, sortDescriptors: [sortDescriptor])
        { (query, results, error) in
            if error != nil {
                print("An error has occured with the following description: \(error?.localizedDescription)")
            } else {
                for r in results! {
                    let result = r as! HKQuantitySample
                    let quantity = result.quantity
                    let count = quantity.doubleValue(for: .kilocalorie())
//                    let count2 = quantity.doubleValue(for: .meter())
                    self.counts = self.counts + count
//                    self.counts2 = self.counts2 + count2
                    DispatchQueue.main.async {
                        self.kkalLabel.text = String(format:"%.2f Kcal",self.counts)
                    }
                }
            }
            print(self.counts)
        }
        healthManager.execute(query)
    }
    func setlabel(value:Double)
    {
        self.kkalLabel.text = String("\(value) Kkal")
    }
    
}
extension Workout: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WorkoutTableViewCell
        
        let activity: Activities
            activity = activities[indexPath.row]
        cell.nameLabel.text = activity.name
        cell.countLabel.text = String("\(activity.current) / \(activity.max) ")
        return cell
    }
}
