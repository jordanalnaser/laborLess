//
//  ViewController.swift
//  laborLess
//
//  Created by Jordan Alnaser on 3/15/18.
//  Copyright © 2018 Jordan Alnaser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Create a link for the Background element that was introcuded in the Storyboard of xCode
    @IBOutlet weak var background: UIImageView!
    let loginButton = UIButton()
    let signupButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Add logo
        addLogo(background)
        
        // Setup Login & Signup Button
        buttonSetup(parentLayer: self, button: loginButton, label: "Login", frame: CGRect(x: 20, y: 500, width: 380, height: 80))
        buttonSetup(parentLayer: self, button: signupButton, label: "Signup", frame: CGRect(x: 20, y: 600, width: 380, height: 80))

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
    func buttonSetup(parentLayer:UIViewController, button:UIButton, label:String, frame: CGRect){
        // This enables user interaction with the button
        button.isUserInteractionEnabled = true
        
        
        // Setup the Look of the button
        button.frame = frame
        button.backgroundColor =  UIColor.init(red: 139.0/255, green: 26.0/255, blue: 16.0/255, alpha: 1)
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        
        // Setup the title of Button
        button.setTitle(label, for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font =  UIFont(name: "Avenir-Heavy", size: 50)
        
        // Setup the Animation of the Button
        button.addTarget(self, action: #selector(buttonPressed(_ :)), for: .touchUpInside)
        
        if label == "Login" {
            // Connect Button to the Login Method
            button.addTarget(self, action: #selector(loginPressed(_ :)), for: .touchUpInside)
        } else if label == "Signup" {
            // Connect Button to the Signup Method
            button.addTarget(self, action: #selector(signupPressed(_ :)), for: .touchUpInside)
        }
        
        parentLayer.view.addSubview(button)
    }

    
    // This creates the press down and up animation of a button
    @objc func buttonPressed(_ sender :UIButton){
        UIButton.animate(withDuration: 0.1,
                         animations: {
                            sender.transform = CGAffineTransform(scaleX: 0.975, y: 0.96)
        },
                         completion: { finish in
                            UIButton.animate(withDuration: 0.1, animations: {
                                sender.transform = CGAffineTransform.identity
                            })
        })
    }
    
    // This contains the logic for the Login Button, and it is triggerd when user hits the login button
    @objc func loginPressed(_ sender :UIButton){
        print("Login Pressed")
        
        // Segue into Main Screen View controller if user logins in successfully, and go from there

    }
    
    // This contains the logic for the Signup Button, and it is triggerd when user hits the signup button
    @objc func signupPressed(_ sender :UIButton){
        print("Signup Pressed")
        
        // Segue into Signup View controller, and go from there
        
    }
}




