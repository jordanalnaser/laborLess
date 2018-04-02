//
//  UserManager.swift
//  laborLess
//
//  Created by Jordan Alnaser on 4/1/18.
//  Copyright © 2018 Jordan Alnaser. All rights reserved.
//

import Firebase
import FirebaseDatabase
import UIKit

class UserManager {
    static let sharedInstance = UserManager()
    private let ref = Database.database().reference()

    private var userID:String!
    private var emailAddress:String!
    private var userName: String!
    private var profilePicture:UIImage!
    private var approvedJobs:[String]!
    private var jobsContainer:[Job]!
    
    // Ratings Out of 10
    private var knowledgeRating:Float!
    private var professionalismRating:Float!
    private var affordabilityRating:Float!
    
    // Do the init stuff here to
    private init(){
        userID = "AmJkvUyHEgOlS22G9VsrmzHTMqD3"
        emailAddress = ""
        userName = ""
        profilePicture = UIImage()
        approvedJobs = []
        affordabilityRating = 0.0
        professionalismRating = 0.0
        knowledgeRating = 0.0
    }
    
    
    // called to load up user data form the data base into the
    static func loadUserData() {
        
        // Load up user Info
        sharedInstance.ref.child("users/\(sharedInstance.userID!)").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user node as a dicitionary of all its subnodes
            let currentUser = snapshot.value as! NSDictionary
            
            // Load up the goodies from Firebase
            sharedInstance.emailAddress = (currentUser.value(forKey: "email")) as! String
            sharedInstance.userName = currentUser.value(forKey: "username") as! String
            sharedInstance.profilePicture = getImagefromURL(currentUser.value(forKey: "profilePicture") as! String)
            
            // Get the sub snapshot containg the list of approved jobs
            let approvedJobsSnapshot = snapshot.childSnapshot(forPath: "approvedJobs").value as! [String:String]
            // fill in the current users list of approved jobs
            for job in approvedJobsSnapshot {
                sharedInstance.approvedJobs.append(job.value)
            }
        })
        
        
        // Load up user ratings
        sharedInstance.ref.child("ratings/\(sharedInstance.userID!)").observeSingleEvent(of: .value, with: { (snapshot) in
            // get the ratings array from the database
            let proffRating = snapshot.childSnapshot(forPath: "professionalism").value as! [String:Float]
            let knowRating = snapshot.childSnapshot(forPath: "knowledge").value as! [String:Float]
            let affoRatings = snapshot.childSnapshot(forPath: "affordability").value as! [String:Float]
        
            print(calcRating(knowRating))
            // Load up the goodies from Firebase
            sharedInstance.knowledgeRating = calcRating(knowRating)
            sharedInstance.affordabilityRating = calcRating(affoRatings)
            sharedInstance.professionalismRating = calcRating(proffRating)

        })
    }
    
    
    
    // Called to load up the jobs container
    static func loadJobsContainer(){
       
        
    }
    

    // This function runs through the ratings array passed in from firebase and calcuates average then returns it
    private static func calcRating(_ ratings:[String:Float]) -> Float {
        var sum:Float = 0
        
        for value in ratings.values {
            sum += value
        }
        
        return (sum/Float(ratings.count))
        
    }
    private static func getImagefromURL(_ URLString:String) -> UIImage {
        let imageURL:URL = URL(string: URLString)!
        var image:UIImage!
        
        let imageData:NSData = NSData(contentsOf: imageURL)!
        image = UIImage(data: imageData as Data)!
        
        // return the newly loaded image
        return image
    }
    

    
// MARK: Getter Functions
    static func getEmailAddress() -> String {
        return sharedInstance.emailAddress
    }
    
    static func getUsername() -> String {
        return sharedInstance.userName
    }
    
    static func getuserID() -> String {
        return sharedInstance.userID
    }
    
    static func getApprovedJobs() -> [String] {
        return sharedInstance.approvedJobs
    }
    
    static func getProfilePicture() -> UIImage {
        return sharedInstance.profilePicture
    }
    
    static func getProffRating() -> Float {
        return sharedInstance.professionalismRating/10
    }

    static func getKnowRating() -> Float {
        return sharedInstance.knowledgeRating/10
    }
    
    static func getAffoRating() -> Float {
        return sharedInstance.affordabilityRating/10
    }
}
