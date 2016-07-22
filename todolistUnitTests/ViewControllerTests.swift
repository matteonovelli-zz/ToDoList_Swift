//
//  ViewControllerTests.swift
//  todolist
//
//  Created by Matteo on 22/7/16.
//  Copyright © 2016 Openfinance. All rights reserved.
//

import XCTest
@testable import todolist

class ViewControllerTests: XCTestCase {
    
    class mockAddFormDelegate: AddToDoFormDelegate {
        
        var createNewToDo = false
        
        func createNewToDo(description: String) {
            createNewToDo = true
        }
    }
    
    var sut: ViewController!
    var mockService: MockToDoService!
    var mockAddToDoForm: MockAddToDoForm!
    
    override func setUp() {
        super.setUp()
        
        mockService = MockToDoService(toDoList: MockToDoList())
        mockAddToDoForm = MockAddToDoForm(delegate: mockAddFormDelegate())
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        
        sut = navigationController.viewControllers[0] as! ViewController
        sut.service = mockService
        sut.addToDoForm = mockAddToDoForm
    }
    
    func testAddButtonAction() {
        sut.addButtonAction()
        XCTAssertTrue(mockAddToDoForm.presentFromViewControllerCalled)
    }
    
    func testCreateAddToDoForm() {
        let form = sut.createAddToDoForm()
        XCTAssertNotNil(form)
        XCTAssertTrue(form.isKindOfClass(AddToDoForm))
    }
    
    func testDeleteToDo() {
        sut.deleteToDo(UITableViewRowAction(), index: NSIndexPath(forRow: 0, inSection: 0))
        XCTAssertTrue(mockService.removeToDoCalled)
    }
    
    func testMoveToDoToNextState() {
        sut.moveToDoToNextState(UITableViewRowAction(), index: NSIndexPath(forRow: 0, inSection: 0))
        XCTAssertTrue(mockService.moveToDoToNextStateCalled)
    }
    
    func testCreateNewToDo() {
        sut.createNewToDo("")
        XCTAssertTrue(mockService.addToDoCalled)
    }
    
    func testNumberOfRowsInSection() {
        let numOfRows = sut.tableView(sut.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(mockService.toDoList.items.count, numOfRows)
    }
    
    func testCellForRowAtIndexPath() {
        let cell = sut.tableView(sut.tableView, cellForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0))
        XCTAssertNotNil(cell)
        XCTAssertEqual(cell.textLabel?.text, mockService.toDoList.items[0].message)
        XCTAssertEqual(cell.detailTextLabel?.text, mockService.toDoList.items[0].state.description)
    }
    
    func testEditActionsForRowAtIndexPath() {
        var actions = sut.tableView(sut.tableView, editActionsForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0))
        XCTAssertNotNil(actions)
        XCTAssertTrue(actions?.count == 2)
        XCTAssertEqual(actions?[0].title, "Delete")
        XCTAssertEqual(actions?[1].title, mockService.toDoList.items[0].state.next.description)
        
        mockService.toDoList.items[0].state = .Finished
        actions = sut.tableView(sut.tableView, editActionsForRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0))
        XCTAssertNotNil(actions)
        XCTAssertTrue(actions?.count == 1)
        XCTAssertEqual(actions?[0].title, "Delete")
    }

}
