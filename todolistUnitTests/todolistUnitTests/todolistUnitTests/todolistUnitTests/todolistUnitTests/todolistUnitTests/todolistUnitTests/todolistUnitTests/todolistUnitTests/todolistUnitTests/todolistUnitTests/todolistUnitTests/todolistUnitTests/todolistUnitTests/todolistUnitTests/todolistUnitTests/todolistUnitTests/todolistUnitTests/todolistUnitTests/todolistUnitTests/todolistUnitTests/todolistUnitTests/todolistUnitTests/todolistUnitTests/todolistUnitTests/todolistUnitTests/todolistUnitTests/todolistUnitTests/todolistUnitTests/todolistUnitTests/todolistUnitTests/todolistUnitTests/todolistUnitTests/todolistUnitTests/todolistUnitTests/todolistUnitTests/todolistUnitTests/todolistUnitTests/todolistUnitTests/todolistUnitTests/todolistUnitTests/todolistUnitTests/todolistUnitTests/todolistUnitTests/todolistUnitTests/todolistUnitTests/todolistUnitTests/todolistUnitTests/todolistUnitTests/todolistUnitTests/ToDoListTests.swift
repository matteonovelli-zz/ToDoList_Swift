//
//  todolistUnitTests.swift
//  todolistUnitTests
//
//  Created by Matteo on 20/7/16.
//  Copyright © 2016 Openfinance. All rights reserved.
//

import XCTest
@testable import todolist

class ToDoListTests: XCTestCase {
    
    var list: ToDoList!
    
    override func setUp() {
        super.setUp()
        
        list = ToDoList()
    }
    
    func testAddItem() {
        list.addItem("Item1")
        XCTAssertEqual(list.items.count, 1)
        
        let item = list.items[0]
        XCTAssertEqual(item.description, "Item1")
        XCTAssertEqual(item.state, ToDoItemStateType.TODO)
    }
    
    func testRemoveItem() {
        list.addItem("item1")
        list.removeItem(atIndex: 0)
        XCTAssertEqual(list.items.count, 0)
    }
    
    func testRemoveItemOutOfBounds() {
        list.addItem("item1")
        list.removeItem(atIndex: 1)
        XCTAssertEqual(list.items.count, 1)
    }
    
}
