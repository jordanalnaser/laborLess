//
//  MainScreen.swift
//  laborLess
//
//  Created by Jordan Alnaser on 3/18/18.
//  Copyright © 2018 Jordan Alnaser. All rights reserved.
//

import UIKit

class MainScreenEmployee: UIViewController, CategoriesScreenDelegate {
  
    var menuOpen = false
    var categoryString = "noChoiceYet"

    @IBOutlet weak var slidingView: UIView!
    @IBOutlet weak var leadingC: NSLayoutConstraint!
    @IBAction func menuTapped(_ sender: Any) {
        if !menuOpen {
            leadingC.constant = 150
            
            //1
            menuOpen = true
        } else {
            //if the hamburger menu IS visible, then move the ubeView back to its original position
            leadingC.constant = 0
            
            //2
            menuOpen = false
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
            print("The animation is complete!")
        }
    }
    
    @IBAction func categorySelectionButton(_ sender: UIButton) {
        // Get the name of the Button that wa pressed
        categoryString = (sender.titleLabel?.text)!
        
        // gog the categories screen
        performSegue(withIdentifier: "goToCategories", sender: sender)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check if we are on the right Segue
        if segue.identifier == "goToCategories"{
            // get a reference to the destiantion View controller
            let destinationViewController = segue.destination as! CategoriesScreen
            // set its delegate to this view controller, as it is the one handling the selection of the csategory
            destinationViewController.delegate = self
        }
    }

    
    // confrom to protocol, give us back the name of the selection
    func didSelectCategory() -> String {
        return categoryString
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Setup the background location, size, and color
//        background.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
//        background.backgroundColor = UIColor.init(red: 139.0/255, green: 26.0/255, blue: 16.0/255, alpha: 1)
//        self.view.addSubview(background) // Adds background element to main view
        
        
        // 
        
        
        
    }
    
}
