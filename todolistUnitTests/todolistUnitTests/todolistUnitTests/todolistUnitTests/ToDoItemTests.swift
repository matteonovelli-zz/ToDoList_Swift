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

    var item: ToDoItem!
    
    override func setUp() {
        super.setUp()
        
        item = ToDoItem("Item1")
    }
    
    func testInit() {
        XCTAssertEqual(item.description, "Item1")
        XCTAssertEqual(item.state, ToDoItemStateType.TODO)
        XCTAssertEqual(item.state.next, ToDoItemStateType.InProgress)
    }
    
    func testStateChanges() {
        item.nextState()
        XCTAssertEqual(item.state, ToDoItemStateType.InProgress)
        XCTAssertEqual(item.state.next, ToDoItemStateType.Done)
        
        item.nextState()
        XCTAssertEqual(item.state, ToDoItemStateType.Done)
        XCTAssertEqual(item.state.next, ToDoItemStateType.Finished)
        
        item.nextState()
        XCTAssertEqual(item.state, ToDoItemStateType.Finished)
        XCTAssertEqual(item.state.next, ToDoItemStateType.Finished)
        
        item.nextState()
        XCTAssertEqual(item.state, ToDoItemStateType.Finished)
        XCTAssertEqual(item.state.next, ToDoItemStateType.Finished)
    }
    
    func testStateDescription() {
        XCTAssertEqual(ToDoItemStateType.TODO.description, "TODO")
        XCTAssertEqual(ToDoItemStateType.InProgress.description, "In Progress")
        XCTAssertEqual(ToDoItemStateType.Done.description, "Done")
        XCTAssertEqual(ToDoItemStateType.Finished.description, "Finished")
    }

}
