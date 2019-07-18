//
//  TableViewCell.swift
//  MiniChallenge2
//
//  Created by Michael Louis on 17/07/19.
//  Copyright © 2019 Michael Louis. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBAction func viewVideoPressed(_ sender: Any) {
        
    }
    @IBOutlet weak var labelName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        labelName.text = String("sadsadabhj")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
