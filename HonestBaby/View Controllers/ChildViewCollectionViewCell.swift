//
//  ChildViewCollectionViewCell.swift
//  HonestBaby
//
//  Created by Aakash Sareen on 3/3/15.
//  Copyright (c) 2015 Aakash Sareen. All rights reserved.
//

import UIKit

class ChildViewCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var childPicture: UIImageView!
    
    func setupCollectionViewCell() {
        
        self.layer.cornerRadius = self.frame.size.width/2
        
        self.childPicture.backgroundColor = UIColor.redColor()

        
    }
    
//    override func drawRect(rect: CGRect) {
//    }
}
