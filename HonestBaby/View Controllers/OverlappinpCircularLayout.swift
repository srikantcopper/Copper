//
//  OverlappinpCircularLayout.swift
//  HonestBaby
//
//  Created by Aakash Sareen on 3/3/15.
//  Copyright (c) 2015 Aakash Sareen. All rights reserved.
//

import UIKit

class OverlappinpCircularLayout: UICollectionViewLayout {
    
    

    override func prepareLayout() {
        super.prepareLayout()
        
    }
    
    override func collectionViewContentSize() -> CGSize {
        return collectionView!.frame.size
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath:
        NSIndexPath) -> UICollectionViewLayoutAttributes {
            
            let attributes =
            super.layoutAttributesForItemAtIndexPath(indexPath)
            
//            self.modifyLayoutAttributes(attributes)
            return attributes
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) ->
        [AnyObject] {
            
            let allAttributesInRect =
            super.layoutAttributesForElementsInRect(rect)
            
//            for cellAttributes in allAttributesInRect! {
//                self.modifyLayoutAttributes(cellAttributes as!
//                    UICollectionViewLayoutAttributes)
//            }
            return allAttributesInRect!
    }
    
    
    func modifyLayoutAttributes(layoutattributes:
        UICollectionViewLayoutAttributes) {
            

    }
   
}
