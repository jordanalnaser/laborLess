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
    let menuPopUp:UIView

    
    // Size of Pop up Options Menu
    var size:CGFloat = 0
    
    
    override init(frame: CGRect) {
        
        // Initlize class attributes
        jobTitle = UILabel()
        jobPicture = UIImageView()
        jobDescription = UILabel()
        menuPopUp = UIView()
        
        // Call super class (UIView) initilizer, which sets up the frame of the current view
        super.init(frame: frame)

        
        
        
        // Constiants used for positons of elements
        let edgeConstant:CGFloat = 10
        let viewWidth = self.frame.width
        
        
    // MARK: Setup the Positioing of the view Elements
        jobTitle.frame = CGRect(x: edgeConstant, y: edgeConstant, width: viewWidth - (2 * edgeConstant), height: 80)
        jobPicture.frame = CGRect(x: edgeConstant, y: 2 * edgeConstant + jobTitle.frame.height, width: viewWidth - (2 * edgeConstant), height: viewWidth * 0.75)
        jobDescription.frame = CGRect(x: edgeConstant, y: 3 * edgeConstant +  jobTitle.frame.height + jobPicture.frame.height, width: viewWidth - (2 * edgeConstant), height: viewWidth * 0.55)
        
        
    // MARK: Setup the look of View Elements
        // Background
        self.backgroundColor = UIColor.init(red: 139.0/255, green: 26.0/255, blue: 16.0/255, alpha: 1)
        
        // Title Label Look
        jobTitle.textAlignment = .center
        jobTitle.numberOfLines = 2
        jobTitle.font = UIFont(name: "HelveticaNeue-Bold", size: 30.0)
        jobTitle.textColor = UIColor.white
        jobTitle.backgroundColor = UIColor.blue
    
        // Description Label look
        jobDescription.textAlignment = .left
        jobDescription.numberOfLines = 0
        jobDescription.font = UIFont(name: "HelveticaNeue", size: 20.0)
        jobDescription.textColor = UIColor.white
        jobDescription.backgroundColor = UIColor.blue
    
    // MARK: Feed data into thier respective Elements
        jobTitle.text = approvedJobs[1].description
        jobPicture.image = approvedJobs[1].icon
        jobDescription.text = "Description: \n\n\(approvedJobs[1].description)"
        
    // MARK: Add Elements to the view
        self.addSubview(jobTitle)
        self.addSubview(jobPicture)
        self.addSubview(jobDescription)
        
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
// MARK: Methods to handle the Force touch apect, and pop up the enu view displaying the two options
    override func draw(_ rect: CGRect) {
        let viewWidth = self.bounds.width
        let viewHeight = self.bounds.height
        
        menuPopUp.frame  = CGRect(x: viewWidth/2 - size, y: viewHeight/2-size, width: size, height: size)
        menuPopUp.backgroundColor = UIColor.red
    }
    
    override func touchesBegan(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        handleTouch(touches)
        // Add menu view to the curret view
        self.addSubview(menuPopUp)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        handleTouch(touches)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>,
                               with event: UIEvent?) {
        size = 0
        self.setNeedsDisplay()
    }
    
    func handleTouch(_ touches:Set<UITouch>) {
        let touch = touches.first
        size = touch!.force * 100
//        print(size)
        self.setNeedsDisplay()
    }
    
    
}
