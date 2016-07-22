//
//  MockToDoItem.swift
//  todolist
//
//  Created by Matteo on 22/7/16.
//  Copyright © 2016 Openfinance. All rights reserved.
//

@testable import todolist

class MockToDoItem: ToDoItem {
    var nextStateCalled: Bool = false
    
    override func nextState() {
        nextStateCalled = true
    }
}