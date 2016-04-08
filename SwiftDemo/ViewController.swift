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

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup Method
        setupUI()
    }

    // MARK: - Table View DataSource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(tableView: UITableView,
                   cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {

        let cell:UITableViewCell = userTableView.dequeueReusableCellWithIdentifier(
                                    "cell",
                                    forIndexPath: indexPath) as UITableViewCell

        if let userNameTextLabel = cell.textLabel {
            userNameTextLabel.text = "Swift"
        }

        return cell
    }

    // MARK: - UI Setup Method

    func setupUI() {
        userTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

}
