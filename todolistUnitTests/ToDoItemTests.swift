//
//  ToDoItemTests.swift
//  todolist
//
//  Created by Matteo on 20/7/16.
//  Copyright © 2016 Openfinance. All rights reserved.
//

import XCTest
@testable import todolist

class ToDoItemTests: XCTestCase {

    var sut: ToDoItem!
    
    override func setUp() {
        super.setUp()
        
        sut = ToDoItem("Item1")
    }
    
    func testInit() {
        XCTAssertEqual(sut.message, "Item1")
        XCTAssertEqual(sut.state, ToDoItemStateType.TODO)
        XCTAssertEqual(sut.state.description, "TODO")
    }
    
    func testNextState() {
        sut.nextState()
        XCTAssertEqual(sut.state, ToDoItemStateType.InProgress)
        XCTAssertEqual(sut.state.description, "In Progress")
        XCTAssertEqual(sut.state.next, ToDoItemStateType.Done)
        
        sut.nextState()
        XCTAssertEqual(sut.state, ToDoItemStateType.Done)
        XCTAssertEqual(sut.state.description, "Done")
        XCTAssertEqual(sut.state.next, ToDoItemStateType.Finished)
        
        sut.nextState()
        XCTAssertEqual(sut.state, ToDoItemStateType.Finished)
        XCTAssertEqual(sut.state.description, "Finished")
        XCTAssertEqual(sut.state.next, ToDoItemStateType.Finished)
        
        sut.nextState()
        XCTAssertEqual(sut.state, ToDoItemStateType.Finished)
    }

}
