//
//  ViewController.swift
//  laborLess
//
//  Created by Jordan Alnaser on 3/15/18.
//  Copyright © 2018 Jordan Alnaser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var background: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Add logo
        addLogo(background)
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


// Function accepts a layer and it adds the App Logo to its top center
func addLogo(_ layer:UIImageView){
    // Setup settings for the background, and its contents
    layer.backgroundColor = UIColor.init(red: 139.0/255, green: 26.0/255, blue: 16.0/255, alpha: 1)
    
    // Setup Logo stuff
    let logo:UILabel = UILabel.init(frame: CGRect(x: layer.frame.midX-128, y: layer.frame.minY + 110, width: 300, height: 300))
    
    // Text Setup
    logo.text  = "laborLess"
    logo.textColor = UIColor.white
    logo.font = UIFont(name: "Avenir-Heavy", size: 58)
    logo.textAlignment = .center
    
    // Border Setup
    logo.layer.borderColor = UIColor.white.cgColor
    logo.layer.borderWidth = 3
    logo.layer.cornerRadius = 150
    
    // Little dash line setup
    let dashLine:UIImageView = UIImageView.init(frame: CGRect(x: layer.frame.minX + 125, y: layer.frame.minY + 190, width: 50, height: 5))
    dashLine.backgroundColor = UIColor.init(red: 99.0/255, green: 153.0/255, blue: 240.0/255, alpha: 1)
    logo.addSubview(dashLine)
    
    // add logo to the background
    layer.addSubview(logo)
}


// Setup Plus Button Options Functions
func setUpOptionButton(_ optionButton:UIButton, imageFile:UIImage){
    optionButton.alpha = 0
    optionButton.isUserInteractionEnabled = false
    
    // setting the image of the button
    optionButton.setImage(imageFile, for: .normal)
    
    // The press animations of these butons
    optionButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchDown)
    optionButton.addTarget(self, action: #selector(buttonRelased(_:)), for: .touchDragExit)
}

// this creates the press down and up aniumation of a button
func buttonPressed(_ button:UIButton){
    button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9);
}
func buttonRelased(_ button:UIButton){
    button.transform = CGAffineTransform(scaleX: 1.0, y: 1.0);
}

