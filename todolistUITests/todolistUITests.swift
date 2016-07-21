//
//  todolistUITests.swift
//  todolistUITests
//
//  Created by Matteo on 21/7/16.
//  Copyright © 2016 Openfinance. All rights reserved.
//

import XCTest

class todolistUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    func showAlert(handler: (XCUIElement?) -> Void) {
        app.navigationBars["To Do List"].buttons["Add"].tap()
        
        let alert = app.alerts["To Do"]
        expectationForPredicate(NSPredicate(format: "exists == 1"),
                                evaluatedWithObject: alert,
                                handler: nil)
        waitForExpectationsWithTimeout(5.0) { error in
            if error == nil {
                handler(alert)
            } else {
                handler(nil)
            }
        }
    }
    
    func testShowAlert() {
        showAlert { (alert) in
            XCTAssertNotNil(alert)
        }
    }
    
    func testCancelAlert() {
        showAlert { (alert) in
            let button = alert?.buttons["Cancel"]
            XCTAssertNotNil(button)
            button?.tap()
        }
    }
    
    func testAddToDo() {
        showAlert { (alert) in
            alert?.collectionViews.textFields["Things to do..."].typeText("Item1")
            alert?.collectionViews.buttons["Add"].tap()
        }
    }
    
}
