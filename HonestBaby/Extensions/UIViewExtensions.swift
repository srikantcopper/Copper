//
//  UIViewExtensions.swift
//  HonestBaby
//
//  Created by Aakash Sareen on 3/9/15.
//  Copyright (c) 2015 Aakash Sareen. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    class func loadFromNibNamed(nibNamed: String, bundle : NSBundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
}