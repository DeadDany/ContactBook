//
//  Contact.swift
//  Contact Book
//
//  Created by Даниил on 08.04.17.
//  Copyright © 2017 D&D Studio. All rights reserved.
//

import Foundation
import Cocoa

// MARK: - Contact Class

class Contact {
    
    // MARK: - Properties
    
    var Name: String
    var Phone: String
    
    // MARK: - Constructor Functions
    
    init() {
        self.Name = ""
        self.Phone = ""
    }
    
    init(Name: String, Phone: String) {
        self.Name = Name
        self.Phone = Phone
    }
}

// MARK: - Global Variables

var ContactList = [Contact]()
var SelectedContactIndex: Int = 0

// MARK: - Contact List Function

func CreateContact(Name: String, Phone: String) -> Void {
    let contact = Contact(Name: Name, Phone: Phone)
    ContactList.append(contact)
}

func SyncContacts() -> Void {
    clearDocument(fileName: "DataBase", withExtension: "db")
    var text: String = ""
    
    for contact in ContactList {
        text += contact.Name + ":" + contact.Phone + "\n"
    }
    
    writeToDocumentsFile(fileName: "DataBase", withExtension: "db", value: text)
}

func ReadContacts() -> Void {
    let ContactsInFile = readFromDocumentsFile(fileName: "DataBase", withExtension: "db").components(separatedBy: .newlines)
    ContactList.removeAll()
    for Line in ContactsInFile {
        let Data = Line.components(separatedBy: ":")
        if Data.count == 2 {
            let ContactObject = Contact(Name: Data[0], Phone: Data[1])
            ContactList.append(ContactObject)
        }
    }
}
