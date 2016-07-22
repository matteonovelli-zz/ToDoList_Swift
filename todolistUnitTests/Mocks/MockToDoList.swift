//
//  MockToDoList.swift
//  todolist
//
//  Created by Matteo on 22/7/16.
//  Copyright © 2016 Openfinance. All rights reserved.
//

@testable import todolist

class MockToDoList: ToDoList {
    var addItemCalled: Bool = false
    var removeItemCalled: Bool = false
    
    override init() {
        super.init()
        
        items.append(MockToDoItem("test"))
    }
    
    override func addItem(item: ToDoItem) {
        addItemCalled = true
    }
    
    override func removeItem(atIndex index: Int) {
        removeItemCalled = true
    }
}