//
//  CategoriesScreen.swift
//  laborLess
//
//  Created by Jordan Alnaser on 3/18/18.
//  Copyright © 2018 Jordan Alnaser. All rights reserved.
//

import UIKit

// this Protocol will handle getting the choice of CAtegory the user selected form the delegate view ocntroller
protocol CategoriesScreenDelegate: class {
    func didSelectCategory() -> String
}

class CategoriesScreen: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // will hold the title of the button the user selected from the previous screen
    var choice:String!
    var jobsContainer:[Job]!
    
    // Creating Delegate link for the MainScreenEmoployee delegation task of sending us which button the user pressed
    weak var delegate: CategoriesScreenDelegate!

    
    
    // Jobs Container Table related functions, to display cells from data contianers
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobsContainer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "protoTypeCell",for: indexPath) as! JobCellTableViewCell
        
        cell.jobIcon.image = jobsContainer[indexPath.row].icon
        cell.jobLabel.text = jobsContainer[indexPath.row].title
        
        return cell
    }
    
    // method congtrols the height of the cells
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // note that indexPath.section is used rather than indexPath.row
        print("You tapped cell number \(indexPath.row).")
    }
    
    
    override func viewDidLoad() {
        choice = "noChoiceYet"

        // Make sure the delegate has been set, to avoid crashing incase it hasnt been set
        guard let delegate = self.delegate else {
            print("Delegate for MainScreenEmployee not set")
            return
        }
        
        // get the choice the user clicked on from the delegate
        choice = delegate.didSelectCategory()
        
        // set the title of the navigation bar to reflect the button that was pressed
        self.navigationItem.title = choice
        
        
        // Get the Appropriate Table based on user selection from previous view
        jobsContainer = whichCategory(choice)
        
        
    }
    
    
    // function will figure out which contianer of jobbs to return based on the choice the user selected from the previous screen
    func whichCategory(_ choice:String) -> [Job] {
        if choice == "House & Yard Maint."{
            return houseJobs
        } else if choice == "Auto Work"{
            return autoJobs
            
        }else if choice == "Pets"{
            return petJobs
            
        }else if choice == "Cleaning"{
            return cleaningJobs
        } else {
            // return the empty default contianer if the label is neither of the above cases, Error Case
            return self.jobsContainer
        }
    }
}

