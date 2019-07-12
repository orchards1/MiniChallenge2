//
//  Mountain.swift
//  MiniChallenge2
//
//  Created by Marcel W on 12/07/19.
//  Copyright © 2019 Michael Louis. All rights reserved.
//

import UIKit

class Mountain{
    var mountainImg: UIImage
    var name: String
    var location: String
    var altitude: String
    
    //initializer
    init(mountainImg: UIImage ,name: String, location: String, altitude: String ){
        self.mountainImg = mountainImg
        self.name = name
        self.location = location
        self.altitude = altitude
    }
}
