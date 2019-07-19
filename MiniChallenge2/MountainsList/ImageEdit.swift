//
//  ImageEdit.swift
//  MiniChallenge2
//
//  Created by Michael Louis on 18/07/19.
//  Copyright © 2019 Michael Louis. All rights reserved.
//

import UIKit

class ImageEdit: UIImageView {

    required public init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 15
        
    }

}
