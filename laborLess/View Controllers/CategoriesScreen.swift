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
    var categoryChoice:String!
    var jobsContainer:[Job]!
    
    // Creating Delegate link for the MainScreenEmoployee delegation task of sending us which button the user pressed
    weak var delegate: CategoriesScreenDelegate!

    
    
    // Jobs Container Table related functions, to display cells from data contianers
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return jobsContainer.count
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            // remove job from the data base
            UserManager.getRef().child("Jobs/\(jobsContainer[indexPath.row].jobID)").removeValue()
            
            print("child deleteed form the databse")

            
            jobsContainer.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "protoTypeCell",for: indexPath) as! JobCellTableViewCell
        
        cell.jobID = jobsContainer[indexPath.row].jobID
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
        
        let cell = tableView.cellForRow(at: indexPath) as! JobCellTableViewCell
        
        // frame top offset
        let barOffset = (self.navigationController?.navigationBar.frame.height)! + 5
        let frame = self.view.frame
        
        self.view.addSubview(JobDetailsView(frame: CGRect(x: frame.minX, y: frame.minY + barOffset, width: frame.width, height: (frame.height - barOffset)), jobID: cell.jobID))
    }
    
    
    override func viewDidLoad() {
        categoryChoice = "noChoiceYet"

        // Make sure the delegate has been set, to avoid crashing incase it hasnt been set
        guard let delegate = self.delegate else {
            print("Delegate for MainScreenEmployee not set")
            return
        }
        
        // get the choice the user clicked on from the delegate
        categoryChoice = delegate.didSelectCategory()
        
        // set the title of the navigation bar to reflect the button that was pressed
        self.navigationItem.title = categoryChoice
        
        // get the jobs that belong in this category
        jobsContainer = getJobsForCategory(UserManager.getJobsContainer(), categoryChoice)
    }
    
    // function returns a subet of jobs that belong in a specific cateogry
    func getJobsForCategory(_ jobsPosted: [Job], _ categoryName: String) -> [Job] {
        var jobsInCategory:[Job] = []
        
        for jobIndex in 0 ..< jobsPosted.count {
            if jobsPosted[jobIndex].jobCategory == categoryName {
                jobsInCategory.append(jobsPosted[jobIndex])
            }
        }
        return jobsInCategory
    }
}


