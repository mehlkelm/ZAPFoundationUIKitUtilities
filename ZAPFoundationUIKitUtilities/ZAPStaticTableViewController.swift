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
        public var headerTitle: String?
        public var footerTitle: String?
        public var rows = [Row]()
        
        public init(rows: [Row], headerTitle header: String? = nil, footerTitle footer: String? = nil) {
            self.rows = rows
            headerTitle = header
            footerTitle = footer
        }
    }
    
    public struct Row {
        public var cell: ((IndexPath) -> (UITableViewCell))
        public var selectionAction: ((IndexPath) -> (Void))?
        public var shouldHighlight: Bool = true
        public var associatedObject: Any? = nil
        public var height: CGFloat = UITableView.automaticDimension
        public var estimatedHeight: CGFloat = UITableView.automaticDimension
        public var indentationLevel: Int = 0
        public var editable: Bool = false
        public var commitEdit: ((UITableViewCell.EditingStyle, IndexPath) -> (Void))?
        public var seguePreparation: ((UIStoryboardSegue, _ sender: Any?, IndexPath) -> Void)?
        public var ID: String? = nil
        
        public init(cell: @escaping ((IndexPath) -> (UITableViewCell)),
             selectionAction: ((IndexPath) -> (Void))? = nil,
             shouldHighlight: Bool = true,
             associatedObject: Any? = nil,
             height: CGFloat = UITableView.automaticDimension,
             estimatedHeight: CGFloat = UITableView.automaticDimension,
             indentationLevel: Int = 0,
             editable: Bool = false,
             commitEdit: ((UITableViewCell.EditingStyle, IndexPath) -> (Void))? = nil,
             seguePreparation: ((UIStoryboardSegue, _ sender: Any?, IndexPath) -> Void)? = nil,
             ID: String? = nil
            ) {
            
            self.cell = cell
            self.selectionAction = selectionAction
            self.shouldHighlight = shouldHighlight
            self.associatedObject = associatedObject
            self.height = height
            self.estimatedHeight = estimatedHeight
            self.indentationLevel = indentationLevel
            self.editable = editable
            self.commitEdit = commitEdit
            self.seguePreparation = seguePreparation
            self.ID = ID
        }
    }
    
    public var sections = [Section]()
    
    open override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            row(for: indexPath).seguePreparation?(segue, sender, indexPath)
        }
    }
    
    // MARK: - Table view data source
    
    public func row(for indexPath: IndexPath) -> Row {
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
