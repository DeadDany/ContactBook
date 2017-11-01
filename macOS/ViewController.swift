//
//  ViewController.swift
//  Contact Book
//
//  Created by Даниил on 08.04.17.
//  Copyright © 2017 D&D Studio. All rights reserved.
//

import AppKit
import Cocoa

class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate, NSWindowDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet weak var TVContactList: NSTableView!
    @IBOutlet weak var TFNameLabel: NSTextField!
    @IBOutlet weak var TFPhoneLabel: NSTextField!
    @IBOutlet weak var TVContactListTable: NSTableView!
    @IBOutlet weak var CLDeleteButton: NSButton!
    @IBOutlet weak var CLEditButton: NSButton!
    
    // MARK: - Overriden Functions and Variables
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TFNameLabel.isSelectable = true
        TFPhoneLabel.isSelectable = true
        CLDeleteButton.isEnabled = false
        CLEditButton.isEnabled = false
        ReadContacts()
    }

    override var representedObject: Any? {
        didSet {
        }
    }
    
    override func viewWillAppear() {
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.refreshList), name: NSNotification.Name(rawValue: "refreshTable"), object: nil)
    }
    
    override func viewDidAppear() {
        self.view.window?.delegate = self
    }
    
    func windowShouldClose(_ sender: Any) -> Bool {
        NSApplication.shared().terminate(self)
        return true
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return ContactList.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return ContactList[row].Name
    }
    
    func refreshList() {
        TVContactListTable.reloadData()
    }
    
    // MARK: - Action Functions
    
    @IBAction func onClick(_ sender: Any) {
        let table = sender as! NSTableView
        let index = table.clickedRow
        
        if index != -1 {
            TFNameLabel.stringValue = ContactList[index].Name
            TFPhoneLabel.stringValue = ContactList[index].Phone
            SelectedContactIndex = index
            CLDeleteButton.isEnabled = true
            CLEditButton.isEnabled = true
        }
    }
    
    @IBAction func CLSaveButton_onClick(_ sender: Any) {
        SyncContacts()
    }
    
    @IBAction func CLLoadButton_onClick(_ sender: Any) {
        ContactList.removeAll()
        ReadContacts()
        TVContactListTable.reloadData()
    }
    
    @IBAction func CLDeleteButton_onClick(_ sender: Any) {
        ContactList.remove(at: SelectedContactIndex)
        refreshList()
    }
}
