//
//  ToDoItemService.swift
//  todolist
//
//  Created by Matteo on 13/7/16.
//  Copyright © 2016 Openfinance. All rights reserved.
//

import Foundation

class ToDoList {

    var items: [ToDoItem] = []
    
    func addItem(description: String) {
        items.append(ToDoItem(description))
    }
    
    func removeItem(atIndex index: Int) {
        guard items.count > index else {
            return
        }
        items.removeAtIndex(index)
    }
        
}