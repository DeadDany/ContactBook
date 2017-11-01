//
//  FileWorker.swift
//  Contact Book
//
//  Created by Даниил on 31.10.17.
//  Copyright © 2017 D&D Studio. All rights reserved.
//

import Foundation

// MARK: - Work with files Functions

func writeToDocumentsFile(fileName: String, withExtension: String, value: String) {
    let path = Bundle.main.path(forResource: fileName, ofType: withExtension)
    
    do {
        try value.write(toFile: path!, atomically: true, encoding: String.Encoding.utf8)
    }
    catch {
        print("writeToDocumentFile() - error")
    }
}

func clearDocument(fileName: String, withExtension: String) {
    let path = Bundle.main.path(forResource: fileName, ofType: withExtension)
    
    do {
        try FileManager.default.removeItem(atPath: path!)
    }
    catch {
        print("clearDocument() - error")
    }
}

func readFromDocumentsFile(fileName: String, withExtension: String) -> String {
    let path = Bundle.main.path(forResource: fileName, ofType: withExtension)
    let checkValidation = FileManager.default
    var file: String = ""
    
    if checkValidation.fileExists(atPath: path!) {
        do {
            try file = String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        }
        catch {
            print("readFromDocumentsFile() - error")
        }
    }
    else {
        file = "*ERROR* \(fileName) does not exist."
    }
    
    return file
}

