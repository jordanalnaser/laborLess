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
    var phoneNumber:String
    
    init(_ title:String, _ icon:UIImage, _ description: String, _ phoneNumber: String) {
        self.title = title
        self.icon = icon
        self.description = description
        self.phoneNumber = phoneNumber
    }
}
