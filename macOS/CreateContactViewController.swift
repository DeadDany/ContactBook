//
//  CreateContactViewController.swift
//  Contact Book
//
//  Created by Даниил on 30.10.17.
//  Copyright © 2017 D&D Studio. All rights reserved.
//

import Cocoa

class CreateContactViewController: NSViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var TFNameField: NSTextField!
    @IBOutlet weak var TFPhoneField: NSTextField!
    
    // MARK: - Overriden Funtions and Variables
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override var representedObject: Any? {
        didSet {
        }
    }
    
    // MARK: - Action Functions
    
    @IBAction func CCCancelButton_onClick(_ sender: Any) {
        self.view.window?.close()
    }
    
    @IBAction func CCAddButton_onClick(_ sender: Any) {
        if !TFNameField.stringValue.isEmpty && !TFPhoneField.stringValue.isEmpty {
            ContactList.append(Contact(Name: TFNameField.stringValue, Phone: TFPhoneField.stringValue))
            self.view.window?.close()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refreshTable"), object: nil)
        }
    }
}
