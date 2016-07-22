//
//  MockViewController.swift
//  todolist
//
//  Created by Matteo on 22/7/16.
//  Copyright © 2016 Openfinance. All rights reserved.
//

import UIKit
@testable import todolist

class MockViewController: ViewController {
    
    var createNewToDoCalled = false
    var presentViewControllerCalled = false
    
    override func createNewToDo(description: String) {
        createNewToDoCalled = true
    }
    
    override func presentViewController(viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
        presentViewControllerCalled = true
    }
}
