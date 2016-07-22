//
//  ToDoItemService.swift
//  todolist
//
//  Created by Matteo on 13/7/16.
//  Copyright © 2016 Openfinance. All rights reserved.
//

import Foundation

class ToDoList {

    var items: [ToDoItem]
    
    init() {
        self.items = []
    }
    
    func addItem(item: ToDoItem) {
        items.append(item)
    }
    
    func removeItem(atIndex index: Int) {
        items.removeAtIndex(index)
    }
        
}