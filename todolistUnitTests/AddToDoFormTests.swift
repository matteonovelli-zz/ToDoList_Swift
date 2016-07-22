//
//  AddToDoFormTests.swift
//  todolist
//
//  Created by Matteo on 22/7/16.
//  Copyright © 2016 Openfinance. All rights reserved.
//

import XCTest
@testable import todolist

class AddToDoFormTests: XCTestCase {
    
    var sut: AddToDoForm!
    var mockViewController: MockViewController!
    
    override func setUp() {
        super.setUp()
        
        mockViewController = MockViewController()
        sut = AddToDoForm(delegate: mockViewController)
    }
    
    func testPresentFromViewController() {
        sut.presentFromViewController(mockViewController)
        let alert = mockViewController.presentedAlertController
        XCTAssertNotNil(alert)
        XCTAssertEqual(alert.title, "To Do")
        XCTAssertEqual(alert.message, "Write what you have to do")
        XCTAssertTrue(alert.textFields?.count == 1)
        XCTAssertEqual(alert.textFields?[0].text, "")
        XCTAssertEqual(alert.textFields?[0].placeholder, "Things to do...")
        XCTAssertTrue(alert.actions.count == 2)
        XCTAssertEqual(alert.actions[0].title, "Add")
        XCTAssertEqual(alert.actions[1].title, "Cancel")
    }
    
    func testDoneHandler() {
        sut.doneHandler(UIAlertAction(title: "", style: .Default, handler: nil))
        XCTAssertTrue(mockViewController.createNewToDoCalled)
    }
    
}
