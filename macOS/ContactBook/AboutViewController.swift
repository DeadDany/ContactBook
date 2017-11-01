//
//  AboutViewController.swift
//  Contact Book
//
//  Created by Даниил on 31.10.17.
//  Copyright © 2017 D&D Studio. All rights reserved.
//

import Cocoa

class AboutViewController: NSViewController {
    
    // MARK: - Outlets
    
    @IBOutlet var TVLicenseBox: NSTextView!
    
    // MARK: - Overriden Funtions and Variables
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TVLicenseBox.textStorage?.append(NSAttributedString(string: "Copyright © 2017, D&D Studio™. All rights reserved.\n\n"))
        TVLicenseBox.textStorage?.append(NSAttributedString(string: "Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:\n"))
        TVLicenseBox.textStorage?.append(NSAttributedString(string: "1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.\n"))
        TVLicenseBox.textStorage?.append(NSAttributedString(string: "2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.\n"))
        TVLicenseBox.textStorage?.append(NSAttributedString(string: "3. Neither the name of the D&D Studio™ nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.\n"))
        TVLicenseBox.textStorage?.append(NSAttributedString(string: "4. All advertising materials mentioning features or use of this software must display the following acknowledgement:\n"))
        TVLicenseBox.textStorage?.append(NSAttributedString(string: "«This product includes software developed by D&D Studio™.»\n\n"))
        TVLicenseBox.textStorage?.append(NSAttributedString(string: "THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.\n"))
    }
    
    override var representedObject: Any? {
        didSet {
        }
    }
    
    // MARK: - Action Functions
    
    @IBAction func AWCloseButton_onClick(_ sender: Any) {
        self.view.window?.close()
    }
}
