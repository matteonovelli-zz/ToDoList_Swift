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
    
    var sut: ToDoList!
    
    override func setUp() {
        super.setUp()
        
        sut = ToDoList()
    }
    
    func testInit() {
        XCTAssertTrue(sut.items.count == 0)
    }
    
    func testAddItem() {
        let item = ToDoItem("")
        sut.addItem(item)
        XCTAssertTrue(sut.items.count == 1)
        XCTAssertTrue(sut.items[0].isEqual(item))
    }
    
    func testRemoveItem() {
        sut.addItem(ToDoItem(""))
        sut.removeItem(atIndex: 0)
        XCTAssertTrue(sut.items.count == 0)
    }
    
}
