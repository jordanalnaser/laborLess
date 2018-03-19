//
//  CategoriesScreen.swift
//  laborLess
//
//  Created by Jordan Alnaser on 3/18/18.
//  Copyright © 2018 Jordan Alnaser. All rights reserved.
//

import UIKit


class CategoriesScreen: UIViewController {
    
    var background = UIView()
    var segueName = "greenSegue"
    
    override func viewDidLoad() {
        
        if segueName == "pinkSegue"{
            background.backgroundColor = UIColor.cyan
        } else if segueName == "greenSegue"{
            background.backgroundColor = UIColor.green

        }else if segueName == "blueSegue"{
            background.backgroundColor = UIColor.blue

        }
        
        self.view.addSubview(background)
        
        
    }
    
    
}
