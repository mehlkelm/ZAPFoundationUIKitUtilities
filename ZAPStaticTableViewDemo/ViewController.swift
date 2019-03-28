//
//  ViewController.swift
//  ZAPStaticTableViewDemo
//
//  Created by Stefan Pauwels on 28.03.19.
//  Copyright © 2019 Zozi Apps. All rights reserved.
//

import UIKit
import ZAPFoundationUIKitUtilities

class ViewController: ZAPStaticTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "aDefaultCell")
        
        sections = [
            Section(
                rows: [
                    Row(
                        // You can define most of the table view cell features here…
                        cell: { (indexPath) -> (UITableViewCell) in
                            let cell = self.tableView.dequeueReusableCell(withIdentifier: "aDefaultCell", for: indexPath)
                            cell.textLabel?.text = "This is a cell!"
                            return cell
                        },
                        selectionAction: { (indexPath) -> (Void) in
                            print("Cell at \(indexPath) has been selected")
                        },
                        shouldHighlight: true,
                        associatedObject: nil,
                        height: 100,
                        estimatedHeight: 100,
                        indentationLevel: 0,
                        editable: false,
                        commitEdit: nil,
                        seguePreparation: nil,
                        ID: nil
                    ),
                    Row(
                        // …or you can just return a cell and leave the rest to the defaults.
                        cell: { (indexPath) -> (UITableViewCell) in
                            let cell = self.tableView.dequeueReusableCell(withIdentifier: "aDefaultCell", for: indexPath)
                            cell.textLabel?.text = "This is another cell!"
                            return cell
                        }
                    )
                ],
                headerTitle: "First Section",
                footerTitle: "This section shows stuff."
            ),
            Section(
                rows: [
                    Row(cell: { (indexPath) -> (UITableViewCell) in
                        let cell = self.tableView.dequeueReusableCell(withIdentifier: "aDefaultCell", for: indexPath)
                        cell.textLabel?.text = "kthxby"
                        return cell
                    })
                ],
                headerTitle: "Cool right?",
                footerTitle: "This is just to show more than one section."
            )
        ]
    }
}

