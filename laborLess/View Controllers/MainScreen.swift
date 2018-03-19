//
//  MainScreen.swift
//  laborLess
//
//  Created by Jordan Alnaser on 3/18/18.
//  Copyright © 2018 Jordan Alnaser. All rights reserved.
//

import UIKit


class MainScreenEmployee: UIViewController {
    @IBOutlet weak var slidingView: UIView!
    @IBOutlet weak var leadingC: NSLayoutConstraint!
    
    var menuOpen = false
    
    
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
