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

var profileImage = UIImage(named: "profile.jpg")


// Approved Jobs Container
let approvedJobs = [Job("Fix Honda", #imageLiteral(resourceName: "honda"), "Car needs a new Battery", "806-215-3150"), Job("Clean Home", #imageLiteral(resourceName: "house"), "Living Room and Kitchen need Deep Cleaning", "806-412-5477")]


// Different Job Categories Containers
let houseJobs = [Job("Mow Lawn", #imageLiteral(resourceName: "lawn"), "Lawn is in pretty bad shape, and needs quite the overhall.", "806-553-4946"),
                 Job("Fix Clogged Sink",#imageLiteral(resourceName: "sink"), "My Kitchen Sink is clogged, and needs repair.", "806-969-4555")]

let autoJobs = [Job("Fix Honda", #imageLiteral(resourceName: "honda"), "Car needs a new Battery", "806-553-4946"),
                Job("Window Stuck Open",#imageLiteral(resourceName: "window") , "My 2010 Ford Fusion drivers window is stuck open, please help, i'll pay antyhing within reason to not be soaked every time it rains", "806-319-2231")]

let petJobs = [Job("Walk 2 Dogs",#imageLiteral(resourceName: "dogs"), "My babies need to be walked every Tuesday at 6 PM", "806-485-1920"),
               Job("Cat needs Grooming",#imageLiteral(resourceName: "cat"), "My Kitten, 6 months old needs a light grooming job, Please dont call if you havn't done this before", "806-485-1920")]


let cleaningJobs = [Job("Clean Home", #imageLiteral(resourceName: "house"), "Living Room and Kitchen need Cleaning and Organizing", "806-122-2394"),
                    Job("Carpet Deep Cleaning",#imageLiteral(resourceName: "carpet") , "Carpets in my home need Deep Cleaning", "806-455-3923")]









