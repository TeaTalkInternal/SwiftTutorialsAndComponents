//
//  UsersCollectionViewCell.swift
//  DiffableDatasourcedCompositionalLayout
//
//  Created by Kevin Vishal Saldanha on 18/09/20.
//  Copyright © 2020 TuffyTiffany. All rights reserved.
//

import UIKit

class UsersCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier: String = "UsersCollectionViewCell"
    
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var addressLabel : UILabel!
}
