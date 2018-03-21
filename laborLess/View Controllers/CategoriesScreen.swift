//
//  CategoriesScreen.swift
//  laborLess
//
//  Created by Jordan Alnaser on 3/18/18.
//  Copyright © 2018 Jordan Alnaser. All rights reserved.
//

import UIKit

// this Protocol will handle getting the choice of CAtegory the user selected form the delegate view ocntroller
protocol CategoriesScreenDelegate: class {
    func didSelectCategory() -> String
}

class CategoriesScreen: UIViewController {
    
    // Creating Delegate link
    weak var delegate: CategoriesScreenDelegate!
    @IBOutlet var background: UIView!

    override func viewDidLoad() {
        var choice = "noChoiceYet"

        // Make sure the delegate has been set, to avoid crashing incase it hasnt been set
        guard let delegate = self.delegate else {
            print("Delegate for FooTwoDelegateController not set")
            return
        }
        
        // get the choice the user clicked on from the delegate
        choice = delegate.didSelectCategory()
         self.parent!.title = choice
        
        // Display Appropriate Table based on user selection from previous view
        if choice == "Pink View"{
            background.backgroundColor = UIColor.cyan
        } else if choice == "Green View"{
            background.backgroundColor = UIColor.green
            
        }else if choice == "Blue View"{
            background.backgroundColor = UIColor.blue
            
        }
        
       
        
    }
}

