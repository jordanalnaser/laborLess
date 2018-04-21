//
//  backGroundCheckView.swift
//  laborLess
//
//  Created by Jordan Alnaser on 4/20/18.
//  Copyright © 2018 Jordan Alnaser. All rights reserved.
//

import UIKit

class backGroundCheckView: UIView {
    
    let label:UILabel
    let retryButton:UIButton
    
    override init(frame: CGRect) {
        // initlize the class attributes
        label = UILabel()
        retryButton = UIButton()
        
        // Call super class (UIView) initilizer, which sets up the frame of the current view
        super.init(frame: frame)
        
        // This is needed to perform desired popup animation
        self.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animate(withDuration: 0.2, delay: 0.4, options: .curveLinear, animations: {
            self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
        
        
        // Constiants used for positons of elements
        let edgeConstant:CGFloat = 10
        let viewWidth = self.frame.width

        
    // MARK: Setup the Positioing of the view Elements
        label.frame = CGRect(x: edgeConstant, y: edgeConstant + (viewWidth/2), width: viewWidth - (2 * edgeConstant), height: 80)
        
        retryButton.frame = CGRect(x: edgeConstant, y: edgeConstant + label.frame.maxY * 1.5, width: viewWidth - 2*edgeConstant, height: viewWidth * 0.2)
        
    // MARK: Setup the look of View Elements
        // Background
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        self.backgroundColor = UIColor.init(red: 139.0/255, green: 26.0/255, blue: 16.0/255, alpha: 1)
        
        // Title Label Look
        label.textAlignment = .center
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name: "HelveticaNeue-Bold", size: 30.0)
        label.text = "You didn't pass the Background Check"
        label.textColor = UIColor.white

    // MARK: Buttons Setup
        // Cancel button Look
        retryButton.layer.cornerRadius = 20
        retryButton.layer.borderWidth = 2
        retryButton.layer.borderColor = UIColor.white.cgColor
        retryButton.titleLabel?.text = "Check Again"
        retryButton.setTitle("Check Again", for: .normal)
        retryButton.setTitleColor(UIColor.white, for: .normal)
        retryButton.titleLabel?.font =  UIFont(name: "Avenir-Heavy", size: 20)
        
        // Button Functionlity
        retryButton.addTarget(self, action: #selector(retryPressed(_ :)), for: .touchUpInside)

    // MARK: Add Elements to the view
        self.addSubview(label)
        self.addSubview(retryButton)

    }
    
    
    // Method is triggered when user taps the addbutton
    @objc func retryPressed(_ sender :UIButton){
        print("retry pressed")
        // Animate the button Click
        UIButton.animate(withDuration: 0.1,
                         animations: {
                            sender.transform = CGAffineTransform(scaleX: 0.975, y: 0.96)
        },
                         completion: { finish in
                            UIButton.animate(withDuration: 0.1, animations: {
                                sender.transform = CGAffineTransform.identity
                            })
                            
                            
                            // Check if the user passed the background check status from firebase
                            UserManager.getRef().child("users/\(UserManager.getuserID())/backgroundCheckStatus").observeSingleEvent(of: .value, with: { (snapshot) in
                                
                                // Get user status as a string from the data snapshot that we just got back from firebase
                                let status = snapshot.value as! String
                                
                                // check if the stsaus passed
                                if status == "passed" {
                                    // user passed the background check, remove the block from the application main view
                                    // Animate the  background check view exsiting the screen, then remove it form superview
                                    UIView.animate(withDuration: 0.15, delay: 0, options: .curveLinear, animations: {
                                        self.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                                    }, completion: { _ in
                                        self.removeFromSuperview()
                                    })
                                    
                                }
                                
                            
                            })
                            
                            
                            
                            
                            
                            
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
