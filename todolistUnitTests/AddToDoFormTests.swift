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
        XCTAssertTrue(mockViewController.presentViewControllerCalled)
    }
    
    func testDoneHandler() {
        sut.doneHandler(UIAlertAction(title: "", style: .Default, handler: nil))
        XCTAssertTrue(mockViewController.createNewToDoCalled)
    }
    
}
