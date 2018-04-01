//
//  Job.swift
//  laborLess
//
//  Created by Jordan Alnaser on 3/21/18.
//  Copyright © 2018 Jordan Alnaser. All rights reserved.
//
import UIKit

class Job {
    var title:String
    var icon:UIImage
    var description:String
    var jobCategory: String
    var jobID:String
    
    init (){
        self.title = ""
        self.icon = UIImage()
        self.description = ""
        self.jobID = ""
        self.jobCategory = ""
    }
    
    init(_ title:String, _ icon:UIImage, _ description: String, _ jobId: String, _ jobCategory:String) {
        self.title = title
        self.icon = icon
        self.description = description
        self.jobID = jobId
        self.jobCategory = jobCategory
    }
}
