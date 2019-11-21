//
//  ContactCell.swift
//  Expandable TableView
//
//  Created by Mohamed Elbana on 11/21/19.
//  Copyright © 2019 Mohamed Elbana. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    
    func initCell(_ contact: Contact) {
        lblName.text = contact.name
        lblPhone.text = contact.phone
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

