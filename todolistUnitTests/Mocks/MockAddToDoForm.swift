//
//  MockAddToDoForm.swift
//  todolist
//
//  Created by Matteo on 22/7/16.
//  Copyright © 2016 Openfinance. All rights reserved.
//

import UIKit
@testable import todolist

class MockAddToDoForm: AddToDoForm {
    
    var presentFromViewControllerCalled = false
    
    override func presentFromViewController(viewController: UIViewController) {
        presentFromViewControllerCalled = true
    }
}
