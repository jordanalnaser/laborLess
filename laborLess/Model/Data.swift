//
//  Data.swift
//  laborLess
//
//  Created by Jordan Alnaser on 3/18/18.
//  Copyright © 2018 Jordan Alnaser. All rights reserved.
//

// This is all stuff that will be updated from database when it is hooked up

import UIKit


//!!!!!!!!!!!!!!!!!!!!!
//!!!!!!!!!!!!!!!!!!!!!
//!!!!!!!!!!!!!!!!!!!!!
//!!!!!!!!!!!!!!!!!!!!!
// ALL OF THIS WILL BE FED FROM THE DATABASE, THIS WILL 100% NOT BE HARDCODED LIKE IT IS NOW IN THE FINAL PRODUCT !!!!!!!!!!!!!!!!!!!!!!
//!!!!!!!!!!!!!!!!!!!!!
//!!!!!!!!!!!!!!!!!!!!!
//!!!!!!!!!!!!!!!!!!!!!
//!!!!!!!!!!!!!!!!!!!!!


// User profile Data
var firstName = "Jordan"
var lastName = "Alnaser"

// Ratings Out of 10
var knowledgeRating:Float = 7
var professionalismRating:Float = 9
var affordabilityRating:Float = 3

var profileImage = UIImageView(image: UIImage(named: "profile.jpg"))


// Approved Jobs Container, which has the ID's of jobs the user has been approved for
let approvedJobs:[String] = [jobsPosted[2].jobID, jobsPosted[6].jobID]


// Posted Job Container
let jobsPosted = [Job("Mow Lawn", #imageLiteral(resourceName: "lawn"), "Lawn is in pretty bad shape, and needs quite the overhall.", "jobID1", "house"),
                  Job("Fix Clogged Sink",#imageLiteral(resourceName: "sink"), "My Kitchen Sink is clogged, and needs repair.", "jobID2", "house"),
                  Job("Fix Honda", #imageLiteral(resourceName: "honda"), "Car needs a new Battery", "jobID3", "auto"),
                  Job("Window Stuck Open",#imageLiteral(resourceName: "window") , "My 2010 Ford Fusion drivers window is stuck open, please help", "jobID4", "auto"),
                  Job("Walk 2 Dogs",#imageLiteral(resourceName: "dogs"), "My puppies need to be walked every Tuesday at 6 PM", "jobID5", "pet"),
                  Job("Cat needs Grooming",#imageLiteral(resourceName: "cat"), "My Kitten, 6 months old needs a light grooming job", "jobID6", "pet"),
                  Job("Clean Home", #imageLiteral(resourceName: "house"), "Living Room and Kitchen need Cleaning and Organizing", "jobID7", "cleaning"),
                  Job("Carpet Deep Cleaning",#imageLiteral(resourceName: "carpet") , "Carpets in my home need Deep Cleaning", "jobID8", "cleaning")]










