//
//  ToDoServiceTests.swift
//  todolist
//
//  Created by Matteo on 20/7/16.
//  Copyright © 2016 Openfinance. All rights reserved.
//

import XCTest
@testable import todolist

class ToDoServiceTests: XCTestCase {
    
    let mockList = MockToDoList()
    var sut: ToDoService!
    
    override func setUp() {
        super.setUp()
        
        sut = ToDoService(toDoList: mockList)
    }
    
    func testAddToDo() {
        sut.addToDo("")
        XCTAssertTrue(mockList.addItemCalled)
    }
    
    func testRemoveToDo() {
        sut.removeToDo(atIndex: 0)
        XCTAssertTrue(mockList.removeItemCalled)
    }
    
    func testMoveToDoToNextState() {
        sut.moveToDoToNextState(index: 0)
        
        let mockItem = mockList.items[0] as! MockToDoItem
        
        XCTAssertTrue(mockItem.nextStateCalled)
    }

}
