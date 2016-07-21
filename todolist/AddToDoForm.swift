//
//  AddToDoAlert.swift
//  todolist
//
//  Created by Matteo on 20/7/16.
//  Copyright © 2016 Openfinance. All rights reserved.
//

import UIKit

protocol AddToDoFormDelegate {
    
    func createNewToDo(description: String)
    
}

class AddToDoForm {

    var delegate: AddToDoFormDelegate
    var alert: UIAlertController
    
    // MARK: Lifecycle
    
    init(delegate: AddToDoFormDelegate) {
        alert = UIAlertController(title: "To Do",
                                  message: "Write what you have to do",
                                  preferredStyle: .Alert)
        self.delegate = delegate
        self.createActions()
    }
    
    // MARK: Private methods
    
    private func doneHandler(alert: UIAlertAction) {
        let text = self.alert.textFields?[0].text
        
        if text!.characters.count > 0 {
            delegate.createNewToDo(text!)
        }
    }
    
    private func createActions() {
        alert.addTextFieldWithConfigurationHandler() { txt in
            txt.placeholder = "Things to do..."
        }
        
        let doneAction: UIAlertAction = UIAlertAction(title: "Add",
                                                      style: .Default,
                                                      handler: doneHandler)
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel",
                                                        style: .Cancel,
                                                        handler: nil)
        
        alert.addAction(doneAction)
        alert.addAction(cancelAction)
    }
    
}
