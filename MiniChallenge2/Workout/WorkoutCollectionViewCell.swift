//
//  WorkoutCollectionViewCell.swift
//  MiniChallenge2
//
//  Created by Mulyanti Lauw on 17/07/19.
//  Copyright © 2019 Michael Louis. All rights reserved.
//

import UIKit

class WorkoutCollectionViewCell: UICollectionViewCell {
    
    weak var textLabel: UILabel!
    weak var daysIcon: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        let textLabel = UILabel(frame: .zero)
//        textLabel.translatesAutoresizingMaskIntoConstraints = false
//        self.contentView.addSubview(textLabel)
//        NSLayoutConstraint.activate([
//            textLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
//            textLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
//            textLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
//            textLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
//            ])
//        self.textLabel = textLabel
//        self.contentView.backgroundColor = .lightGray
//        self.textLabel.textAlignment = .center
        
        
        let daysIcon = UIImageView(frame: .zero)
        daysIcon.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(daysIcon)
        NSLayoutConstraint.activate([
            daysIcon.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            daysIcon.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            daysIcon.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            daysIcon.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            ])
        self.daysIcon = daysIcon
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        fatalError("Interface Builder is not supported!")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        fatalError("Interface Builder is not supported!")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.daysIcon.image = nil
    }

}
