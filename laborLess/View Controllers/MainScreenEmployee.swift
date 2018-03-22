//
//  MainScreen.swift
//  laborLess
//
//  Created by Jordan Alnaser on 3/18/18.
//  Copyright © 2018 Jordan Alnaser. All rights reserved.
//

import UIKit

class MainScreenEmployee: UIViewController, CategoriesScreenDelegate, UITableViewDelegate, UITableViewDataSource{
  
    var menuOpen = false
    var categoryString = "noChoiceYet"

    @IBOutlet weak var background: UIView!
    // used for the blue effect
    var darkBlur:UIBlurEffect!
    var blurView:UIVisualEffectView!
    @IBOutlet weak var leadingC: NSLayoutConstraint!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var knowledgeProgress: UIProgressView!
    @IBOutlet weak var professionalismProgress: UIProgressView!
    @IBOutlet weak var affordabilityProgress: UIProgressView!
    
    
    
    @IBAction func menuTapped(_ sender: Any) {
        
        if !menuOpen {
            leadingC.constant = 250
            background.addSubview(blurView)
            menuOpen = true
        } else {
            //if the menu is open, then move the background back to its original position
            leadingC.constant = 0
            menuOpen = false
        }
        
        // Animation for mobing the background, along with displaying the blur effect view
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseIn, animations: {
            self.menuOpen == true ? (self.blurView.alpha = 1) : (self.blurView.alpha = 0)
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
            if !self.menuOpen{
                // to be done only if the menu is on its way to close
                self.blurView.removeFromSuperview()
            }
        }
    }
    
    @IBAction func categorySelectionButton(_ sender: UIButton) {
        // Get the name of the Button that wa pressed
        categoryString = (sender.titleLabel?.text)!
        
        // gog the categories screen
        performSegue(withIdentifier: "goToCategories", sender: sender)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // check if we are on the right Segue
        if segue.identifier == "goToCategories"{
            // get a reference to the destiantion View controller
            let destinationViewController = segue.destination as! CategoriesScreen
            // set its delegate to this view controller, as it is the one handling the selection of the csategory
            destinationViewController.delegate = self
        }
    }

    
    // confrom to protocol, give us back the name of the selection
    func didSelectCategory() -> String {
        return categoryString
    }
    
    
    // Jobs Approved Table related functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return approvedJobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "protoTypeCell",for: indexPath) as! JobCellTableViewCell
        
        cell.jobIcon.image = approvedJobs[indexPath.row].icon
        cell.jobLabel.text = approvedJobs[indexPath.row].title
        
        return cell
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Setup the background color
        background.backgroundColor = UIColor.init(red: 139.0/255, green: 26.0/255, blue: 16.0/255, alpha: 1)
        
        // used to create a blur effdect on the background when the menue is open
        self.darkBlur = UIBlurEffect(style: UIBlurEffectStyle.dark)
        self.blurView = UIVisualEffectView(effect: darkBlur)
        self.blurView.alpha = 0
        self.blurView.frame = (background.superview?.frame)!
        
        
        // adding Profile Data
        greetingLabel.text = "Hello, \(firstName)"
        
        professionalismProgress.progress = professionalismRating/10
        knowledgeProgress.progress = knowledgeRating/10
        affordabilityProgress.progress = affordabilityRating/10
        
        
        
        
        
    }
    
}
