//
//  ChildViewCell.swift
//  HonestBaby
//
//  Created by Aakash Sareen on 3/2/15.
//  Copyright (c) 2015 Aakash Sareen. All rights reserved.
//

import UIKit

class ChildViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var myCollectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //Collection view data source
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ChildViewCell", forIndexPath: indexPath) as! ChildViewCollectionViewCell
        cell.backgroundColor = UIColor.blackColor()
        cell.setupCollectionViewCell()
        

        // Configure the cell
        return cell
    }
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            

            return CGSize(width: 100, height: 100)
    }
    
    //3
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat{
            
            return -50
            
    }
    

    
    
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            
            let leftInset = self.myCollectionView.frame.size.width/2 - 50
            let rightInset = CGFloat(0)
            //self.myCollectionView.frame.size.width/2 - 50
            let topInset = self.myCollectionView.frame.size.height/2 - 50
            let bottomInset = self.myCollectionView.frame.size.height/2 - 50
            let sectionInsets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)


            return sectionInsets
    }

}
