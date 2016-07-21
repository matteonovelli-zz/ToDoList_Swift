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

    func testToDoListService() {
        let service = ToDoService()
        
        let list: ToDoList = service.toDoList
        XCTAssertEqual(list.items.count, 0)
        
        service.addToDo("Item1")
        XCTAssertEqual(list.items.count, 1)
        
        service.moveToDoToNextState(index: 0)
        XCTAssertEqual(list.items[0].state, ToDoItemStateType.InProgress)
        
        service.moveToDoToNextState(index: 0)
        XCTAssertEqual(list.items[0].state, ToDoItemStateType.Done)
        
        service.moveToDoToNextState(index: 0)
        XCTAssertEqual(list.items[0].state, ToDoItemStateType.Finished)
        
        service.removeToDo(atIndex: 0)
        XCTAssertEqual(list.items.count, 0)
    }

}
