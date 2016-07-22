//
//  ToDoItem.swift
//  todolist
//
//  Created by Matteo on 13/7/16.
//  Copyright © 2016 Openfinance. All rights reserved.
//

import Foundation

enum ToDoItemStateType: CustomStringConvertible {
    case TODO
    case InProgress
    case Done
    case Finished
    
    var description: String {
        switch self {
        case TODO:
            return "TODO"
        case InProgress:
            return "In Progress"
        case Done:
            return "Done"
        case .Finished:
            return "Finished"
        }
    }
    
    var next: ToDoItemStateType {
        switch self {
        case TODO:
            return .InProgress
        case InProgress:
            return .Done
        case Done:
            return .Finished
        default:
            return .Finished
        }
    }
    
    mutating func setNext() {
        switch self {
        case TODO:
            self = InProgress
        case InProgress:
            self = Done
        case Done:
            self = Finished
        default:
            self = Finished
        }
    }
}

class ToDoItem: NSObject {
    var message: String
    var state: ToDoItemStateType
    
    init(_ message: String) {
        self.message = message
        state = .TODO
    }
    
    func nextState() {
        state.setNext()
    }
}
