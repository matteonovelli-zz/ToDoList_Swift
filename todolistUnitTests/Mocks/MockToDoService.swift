//
//  MockToDoService.swift
//  todolist
//
//  Created by Matteo on 22/7/16.
//  Copyright © 2016 Openfinance. All rights reserved.
//

@testable import todolist

class MockToDoService: ToDoService {
    var addToDoCalled = false
    var removeToDoCalled = false
    var moveToDoToNextStateCalled = false
    
    override init(toDoList: ToDoList) {
        super.init(toDoList: toDoList)
    }
    
    override func addToDo(description: String) {
        addToDoCalled = true
    }
    
    override func removeToDo(atIndex index: Int) {
        removeToDoCalled = true
    }
    
    override func moveToDoToNextState(index index: Int) {
        moveToDoToNextStateCalled = true
    }
}
