//
//  GroupCell.swift
//  Expandable TableView
//
//  Created by Mohamed Elbana on 11/21/19.
//  Copyright © 2019 Mohamed Elbana. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblCount: UILabel!
    
    func initCell(_ groupTitle: String,_ groupCount: Int) {
        lblTitle.text = groupTitle
        lblCount.text = "\(groupCount) No"
    }
}
