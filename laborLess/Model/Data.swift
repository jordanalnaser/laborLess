//
//  Data.swift
//  laborLess
//
//  Created by Jordan Alnaser on 3/18/18.
//  Copyright © 2018 Jordan Alnaser. All rights reserved.
//

// This is all stuff that will be updated from database when it is hooked up

import UIKit


// User profile Data
var firstName = "Jordan"
var lastName = "Alnaser"

// Ratings Out of 10
var knowledgeRating:Float = 7
var professionalismRating:Float = 9
var affordabilityRating:Float = 3

var profileImage = UIImage(named: "profile.jpg")


// Approved Jobs Container
let approvedJobs = [Job("Fix Honda", #imageLiteral(resourceName: "honda"), "Car needs a new Battery"), Job("Clean Home", #imageLiteral(resourceName: "house"), "House needs Deep Cleaning")]


