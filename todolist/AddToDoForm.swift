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

class AddToDoForm: NSObject {

    var delegate: AddToDoFormDelegate
    private var alert: UIAlertController
    
    // MARK: Lifecycle
    
    init(delegate: AddToDoFormDelegate) {
        alert = UIAlertController(title: "To Do",
                                  message: "Write what you have to do",
                                  preferredStyle: .Alert)
        self.delegate = delegate
        
        super.init()
        
        self.createActions()
    }
    
    // MARK: Methods
    
    func presentFromViewController(viewController: UIViewController) {
        alert.textFields?[0].text = ""
        viewController.presentViewController(alert, animated: true, completion: nil)
    }
    
    func doneHandler(action: UIAlertAction) {
        let text = alert.textFields?[0].text
        delegate.createNewToDo(text!)
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
