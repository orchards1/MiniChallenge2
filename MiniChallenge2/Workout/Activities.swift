//
//  Mountain.swift
//  MiniChallenge2
//
//  Created by Marcel W on 12/07/19.
//  Copyright © 2019 Michael Louis. All rights reserved.
//

import UIKit

class Activities{
    var name: String
    var current: Int
    var max: Int
    
    //initializer
    init(name: String, current: Int, max: Int ){
        self.name = name
        self.current = current
        self.max = max
    }
}
