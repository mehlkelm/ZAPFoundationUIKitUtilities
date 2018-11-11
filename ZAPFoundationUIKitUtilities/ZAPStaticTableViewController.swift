//
//  ZAPStaticTableViewController.swift
//  ZAPFoundationUIKitUtilities
//
//  Created by Stefan Pauwels on 10.11.18.
//  Copyright © 2018 Zozi Apps. All rights reserved.
//

import UIKit

open class ZAPStaticTableViewController: UITableViewController {
    
    public struct Section {
        var headerTitle: String?
        var footerTitle: String?
        var rows = [Row]()
        
        public init(rows: [Row], headerTitle header: String? = nil, footerTitle footer: String? = nil) {
            self.rows = rows
            headerTitle = header
            footerTitle = footer
        }
    }
    
    public struct Row {
        var shouldHighlight: Bool = true
        var cell: ((IndexPath) -> (UITableViewCell))
        var selectionAction: ((IndexPath) -> (Void))?
        var height: CGFloat = UITableView.automaticDimension
        var estimatedHeight: CGFloat = UITableView.automaticDimension
        var indentationLevel: Int = 0
        var editable: Bool = false
        var commitEdit: ((UITableViewCell.EditingStyle, IndexPath) -> (Void))?
    }
    
    public var sections = [Section]()
    
    // MARK: - Table view data source
    
    func row(for indexPath: IndexPath) -> Row {
        return sections[indexPath.section].rows[indexPath.row]
    }
    
    override open func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override open func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].headerTitle
    }
    
    override open func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return sections[section].footerTitle
    }
    
    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rows.count
    }
    
    override open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return row(for: indexPath).cell(indexPath)
    }
    
    override open func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return row(for: indexPath).editable
    }
    
    override open func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        row(for: indexPath).commitEdit?(editingStyle, indexPath)
    }
    
    // MARK: - Table view delegate
    
    override open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return row(for: indexPath).height
    }
    
    override open func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return row(for: indexPath).estimatedHeight
    }
    
    override open func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        return row(for: indexPath).indentationLevel
    }
    
    override open func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return row(for: indexPath).shouldHighlight
    }
    
    override open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        row(for: indexPath).selectionAction?(indexPath)
    }
    
}

extension ZAPStaticTableViewController.Row {
    public init(cell: @escaping ((IndexPath) -> (UITableViewCell)), selectionAction: ((IndexPath) -> (Void))?) {
        self.cell = cell
        self.selectionAction = selectionAction
    }
}
