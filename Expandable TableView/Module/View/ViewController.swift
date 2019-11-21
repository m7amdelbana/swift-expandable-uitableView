//
//  ViewController.swift
//  Expandable TableView
//
//  Created by Mohamed Elbana on 11/21/19.
//  Copyright © 2019 Mohamed Elbana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tableViewData: [Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initFakeData()
        initTableView()
    }
    
    func initFakeData() {
        tableViewData = [
                Group(title: "Family",
                      contacts: [
                        Contact(name: "Contact 1", phone: "+20 123 456 7788"),
                        Contact(name: "Contact 2", phone: "+20 123 456 7788")]
            ),
                Group(title: "Friends",
                      contacts: [
                        Contact(name: "Contact 3", phone: "+20 123 456 7788"),
                        Contact(name: "Contact 4", phone: "+20 123 456 7788")]
            ),
                Group(title: "Work",
                      contacts: [
                        Contact(name: "Contact 5", phone: "+20 123 456 7788"),
                        Contact(name: "Contact 6", phone: "+20 123 456 7788"),
                        Contact(name: "Contact 7", phone: "+20 123 456 7788")]
            ),
                Group(title: "School",
                      contacts: [
                        Contact(name: "Contact 8", phone: "+20 123 456 7788"),
                        Contact(name: "Contact 9", phone: "+20 123 456 7788"),
                        Contact(name: "Contact 10", phone: "+20 123 456 7788")]
        )]
    }
    
    func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ContactCell", bundle: nil), forCellReuseIdentifier: "ContactCell")
        tableView.register(UINib(nibName: "GroupCell", bundle: nil), forCellReuseIdentifier: "GroupCell")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].isOpen {
            return tableViewData[section].contacts.count + 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! GroupCell
            cell.initCell(tableViewData[indexPath.section].title, tableViewData[indexPath.section].contacts.count)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactCell
        cell.initCell(tableViewData[indexPath.section].contacts[indexPath.row - 1])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if tableViewData[indexPath.section].isOpen {
                tableViewData[indexPath.section].isOpen = false
            } else {
                tableViewData[indexPath.section].isOpen = true
            }
            reloadSections(indexPath: indexPath)
        }
    }
    
    func reloadSections(indexPath: IndexPath) {
        let sections = IndexSet.init(integer: indexPath.section)
        tableView.reloadSections(sections, with: .none)
    }
}

