//
//  AddToDoAlertTests.swift
//  todolist
//
//  Created by Matteo on 20/7/16.
//  Copyright © 2016 Openfinance. All rights reserved.
//

import XCTest
@testable import todolist

class AddToDoAlertTests: XCTestCase {

    var form: AddToDoForm!
    
    override func setUp() {
        super.setUp()
        
        form = AddToDoForm()
    }

    func testFormInitialization() {
        XCTAssertNotNil(form.alert)
        XCTAssertEqual(form.alert.textFields?.count, 1)
        XCTAssertEqual(form.alert.actions.count, 2)
    }
    
}
