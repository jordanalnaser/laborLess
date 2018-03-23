//
//  ViewController.swift
//  laborLess
//
//  Created by Jordan Alnaser on 3/15/18.
//  Copyright © 2018 Jordan Alnaser. All rights reserved.
//

import UIKit

class LoginScreen: UIViewController {
    
    // Create a link for the Background element that was introcuded in the Storyboard of xCode
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // setup the look of the two buttons
        buttonSetup(button: loginButton)
        buttonSetup(button: signupButton)

    }


    // Setup Button Border look
    func buttonSetup(button:UIButton){

        // Setup the Look of the button
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
    }




    // This contains the logic for the Login Button, and it is triggerd when user hits the login button
    @IBAction func loginPresed(_ sender: UIButton) {
        // Trigger the (Login View) that will prompt user for login data
        
        // NEEDS TO BE DONE!!!!!
        // 1. make login view with text fields, and add it as a popup subview
        // 2. connect to fireabse to authiticate data entered
        // 3. set the below two variables accodinly and update data containers with apropriate data from database
        
        let successfulLogin:Bool = true // will be set when user is authenticated from Firebase
        let loginType = "Employee" // Will contain the Type of user logged in, also retireved from Firebase
        
        // 4. do the code below if all whats above is done
        
        if successfulLogin {
            // User is authenticated
            if loginType == "Employee" {
                // Segue into Main Screen for Employees View controller
                self.performSegue(withIdentifier: "loginSegue-Employee", sender:nil)
            } else if loginType == "Employer" {
                // Segue into Main Screen for Employees View controller
                
                // NEEDS TO BE DONE!!!!!!
            }
            
        }
    }
    
    // This contains the logic for the Signup Button, and it is triggerd when user hits the signup button
    @IBAction func signupPressed(_ sender: UIButton) {
        
        print("Signup Pressed")
        
        // Segue into Signup View controller, and go from there
    }
}




