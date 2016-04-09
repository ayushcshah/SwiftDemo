//
//  ViewController.swift
//  SwiftDemo
//
//  Created by Ayush Shah on 4/6/16.
//  Copyright © 2016 Ayush Shah. All rights reserved.
//

import UIKit

class ViewController:   UIViewController,
                        UITableViewDelegate,
                        UITableViewDataSource {
    // MARK: - IBoutlet

    @IBOutlet weak var userTableView: UITableView!

    var users : [SDUser] = []

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup Method
        setupData()
    }

    // MARK: - Table View DataSource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {

        let cell:UITableViewCell = userTableView.dequeueReusableCellWithIdentifier(
                                    "cell",
                                    forIndexPath: indexPath) as UITableViewCell

        if let nameLabel = cell.textLabel {
            nameLabel.text = users[indexPath.row].name
        }
        if let cityLabel = cell.detailTextLabel, userAddress = users[indexPath.row].address {
            cityLabel.text = userAddress.city
        }

        return cell
    }

    // MARK: - Setup Method

    func setupData() {
        UserNetworking().getAllUser { (SDUsers, error) in
            if let users = SDUsers {
                self.users = users
                self.userTableView.reloadData()
            } else {
                print(error?.localizedDescription)
            }
        }
    }

}
