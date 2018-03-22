//
//  JobCellTableViewCell.swift
//  laborLess
//
//  Created by Jordan Alnaser on 3/21/18.
//  Copyright © 2018 Jordan Alnaser. All rights reserved.
//

import UIKit

class JobCellTableViewCell: UITableViewCell {

    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var jobIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
