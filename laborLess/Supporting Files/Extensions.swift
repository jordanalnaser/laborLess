//
//  Extensions.swift
//  laborLess
//
//  Created by Jordan Alnaser on 3/16/18.
//  Copyright © 2018 Jordan Alnaser. All rights reserved.
//
import  UIKit


extension UIImage {
    static func imageWithColor(tintColor: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        tintColor.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
