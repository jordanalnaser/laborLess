//
//  JobDetailsView.swift
//  laborLess
//
//  Created by Jordan Alnaser on 3/22/18.
//  Copyright © 2018 Jordan Alnaser. All rights reserved.
//

import UIKit

class JobDetailsView: UIView {
    
    let jobTitle:UILabel
    let jobPicture:UIImageView
    let jobDescription:UILabel
    let cancelButton:UIButton
    let addButton:UIButton
    
    // Size of Pop up Options Menu
    var size:CGFloat = 0
    
    
    init(frame: CGRect, jobID:String) {
        
        // Initlize class attributes
        jobTitle = UILabel()
        jobPicture = UIImageView()
        jobDescription = UILabel()
        cancelButton = UIButton()
        addButton = UIButton()
        
        // Call super class (UIView) initilizer, which sets up the frame of the current view
        super.init(frame: frame)
        
        // This is needed to perform desired popup animation
        self.transform = CGAffineTransform(scaleX: 0, y: 0)
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }, completion: nil)
        
        
        // Constiants used for positons of elements
        let edgeConstant:CGFloat = 10
        let viewWidth = self.frame.width
        let buttonWidth = (viewWidth - (2 * edgeConstant))/2
        
        
    // MARK: Setup the Positioing of the view Elements
        jobTitle.frame = CGRect(x: edgeConstant, y: edgeConstant, width: viewWidth - (2 * edgeConstant), height: 80)
        jobPicture.frame = CGRect(x: edgeConstant, y: 2 * edgeConstant + jobTitle.frame.height, width: viewWidth - (2 * edgeConstant), height: viewWidth * 0.75)
        jobDescription.frame = CGRect(x: edgeConstant, y: 3 * edgeConstant +  jobTitle.frame.height + jobPicture.frame.height, width: viewWidth - (2 * edgeConstant), height: viewWidth * 0.3)
        addButton.frame = CGRect(x: edgeConstant + buttonWidth, y: 4 * edgeConstant +  jobTitle.frame.height + jobPicture.frame.height + jobDescription.frame.height, width: buttonWidth, height: viewWidth * 0.2)
        cancelButton.frame = CGRect(x: edgeConstant, y: 4 * edgeConstant +  jobTitle.frame.height + jobPicture.frame.height + jobDescription.frame.height, width: buttonWidth - edgeConstant, height: viewWidth * 0.2)
        
        
    // MARK: Setup the look of View Elements
        // Background
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        self.backgroundColor = UIColor.init(red: 139.0/255, green: 26.0/255, blue: 16.0/255, alpha: 1)
        
        // Title Label Look
        jobTitle.textAlignment = .center
        jobTitle.numberOfLines = 2
        jobTitle.adjustsFontSizeToFitWidth = true
        jobTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 30.0)
        jobTitle.textColor = UIColor.white
    
        // Description Label look
        jobDescription.textAlignment = .left
        jobDescription.numberOfLines = 0
        jobDescription.font = UIFont(name: "HelveticaNeue", size: 20.0)
        jobDescription.textColor =  UIColor.white 
        
    // MARK: Buttons Setup
        // Cancel button Look
        cancelButton.layer.cornerRadius = 20
        cancelButton.layer.borderWidth = 2
        cancelButton.layer.borderColor = UIColor.white.cgColor
        cancelButton.titleLabel?.text = "Cancel"
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(UIColor.white, for: .normal)
        cancelButton.titleLabel?.font =  UIFont(name: "Avenir-Heavy", size: 20)
        
        // addbutton look
        addButton.layer.cornerRadius = 20
        addButton.layer.borderWidth = 2
        addButton.layer.borderColor = UIColor.white.cgColor
        addButton.setTitle("Elect to Do", for: .normal)
        addButton.setTitleColor(UIColor.white, for: .normal)
        addButton.titleLabel?.font =  UIFont(name: "Avenir-Heavy", size: 20)
        
        // Button Functionlity
        addButton.addTarget(self, action: #selector(addPressed(_ :)), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelPressed(_ :)), for: .touchUpInside)
        
        
    
    // MARK: Feed data into thier respective Elements
        
        
        let jobIndex = getJob(jobID)
        
        jobTitle.text = UserManager.getJobsContainer()[jobIndex].title
        jobPicture.image = UserManager.getJobsContainer()[jobIndex].icon
        jobDescription.text = "Description: \n\(UserManager.getJobsContainer()[jobIndex].description)"
        
        
        
    // MARK: Add Elements to the view
        self.addSubview(jobTitle)
        self.addSubview(jobPicture)
        self.addSubview(jobDescription)
        self.addSubview(addButton)
        self.addSubview(cancelButton)
        
        
    }
    
    // Method is triggered when user taps the addbutton
    @objc func addPressed(_ sender :UIButton){
        print("add pressed")
        // Animate the button Click
        UIButton.animate(withDuration: 0.1,
                         animations: {
                            sender.transform = CGAffineTransform(scaleX: 0.975, y: 0.96)
        },
                         completion: { finish in
                            UIButton.animate(withDuration: 0.1, animations: {
                                sender.transform = CGAffineTransform.identity
                            })
                            
                            // DO LOGIC HERE THAT CORRSPONDS TO WHAT THE BUTTON IS SUPPOSED TO DO
                            
                            
                            
                            // Animate the Job Details view exsiting the screen, then remove it form superview
                            UIView.animate(withDuration: 0.15, delay: 0, options: .curveLinear, animations: {
                                
                                self.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                            }, completion: { _ in
                                self.removeFromSuperview()
                            })
        })
    }

    // Method is triggered when user taps the cancel button
    @objc func cancelPressed(_ sender :UIButton){
        print("cancel pressed")
        // Animate the button Click
        UIButton.animate(withDuration: 0.1,
                         animations: {
                            sender.transform = CGAffineTransform(scaleX: 0.975, y: 0.96)
        },
                         completion: { finish in
                            UIButton.animate(withDuration: 0.1, animations: {
                                sender.transform = CGAffineTransform.identity
                            })
                            
                            // DO LOGIC HERE THAT CORRSPONDS TO WHAT THE BUTTON IS SUPPOSED TO DO
                            
                            
                            
                            // Animate the Job Details view exsiting the screen, then remove it form superview
                            UIView.animate(withDuration: 0.15, delay: 0, options: .curveLinear, animations: {
                                
                                self.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                            }, completion: { _ in
                                self.removeFromSuperview()
                            })
        })
    }

    
    // this function gives me back the job index i need to display to the user
    func getJob(_ jobID: String) -> Int {
        for jobIndex in 0 ..< UserManager.getJobsContainer().count {
            if UserManager.getJobsContainer()[jobIndex].jobID == jobID {
                return jobIndex
            }
        }
        return -1
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
