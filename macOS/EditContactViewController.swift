//
//  EditContactViewController.swift
//  Contact Book
//
//  Created by Даниил on 30.10.17.
//  Copyright © 2017 D&D Studio. All rights reserved.
//

import Cocoa

class EditContactViewController: NSViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var TFNameField: NSTextField!
    @IBOutlet weak var TFPhoneField: NSTextField!
    
    // MARK: - Overriden Functions and Variables
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TFNameField.stringValue = ContactList[SelectedContactIndex].Name
        TFPhoneField.stringValue = ContactList[SelectedContactIndex].Phone
    }
    
    override var representedObject: Any? {
        didSet {
        }
    }
    
    // MARK: - Action Functions
    
    @IBAction func ECCancelButton_onClick(_ sender: Any) {
        self.view.window?.close()
    }
    
    @IBAction func ECSaveButton_onClick(_ sender: Any) {
        if !TFNameField.stringValue.isEmpty && !TFPhoneField.stringValue.isEmpty {
            ContactList[SelectedContactIndex].Name = TFNameField.stringValue
            ContactList[SelectedContactIndex].Phone = TFPhoneField.stringValue
            self.view.window?.close()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refreshTable"), object: nil)
        }
    }
}
