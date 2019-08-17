//
//  NumberedListTableViewController.swift
//  ios-challenge
//
//  Created by Scott Marchant on 4/16/19.
//  Copyright © 2019 Owlet Baby Care Inc. All rights reserved.
//

import UIKit

class NumberedListTableViewController: UITableViewController {
    
    private var listOfNumbers: [Int] = []
    
    private let serialQueue = DispatchQueue(label: "AsynchronousListGenerator",
                                    qos: .userInitiated,
                                    attributes: .concurrent)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 5.0) {
            
            self.serialQueue.async {
                for number in 1...100 {
                    self.listOfNumbers.append(number)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfNumbers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let listItem = listOfNumbers[indexPath.row]

        cell.textLabel!.text = String(listItem)

        return cell
    }
}
