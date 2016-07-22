//
//  ToDoService.swift
//  todolist
//
//  Created by Matteo on 20/7/16.
//  Copyright © 2016 Openfinance. All rights reserved.
//

import Foundation

class ToDoService {
    
    var toDoList: ToDoList
    
    init(toDoList: ToDoList) {
        self.toDoList = toDoList
    }
    
    func addToDo(description: String) {
        toDoList.addItem(ToDoItem(description))
    }
    
    func removeToDo(atIndex index: Int) {
        toDoList.removeItem(atIndex: index)
    }
    
    func moveToDoToNextState(index index: Int) {
        toDoList.items[index].nextState()
    }
    
}