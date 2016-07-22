//
//  ViewController.swift
//  todolist
//
//  Created by Matteo on 12/7/16.
//  Copyright © 2016 Openfinance. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, AddToDoFormDelegate {

    var service: ToDoService!
    var addToDoForm: AddToDoForm!
    
    // MARK: Actions
    
    @IBAction
    func addButtonAction() {
        CATransaction.begin()
        
        addToDoForm.presentFromViewController(self)
        
        CATransaction.setCompletionBlock() {
            self.tableView.setEditing(false, animated: true)
        }
    
        CATransaction.commit()
    }
    
    // MARK: Private methods

    func createAddToDoForm() -> AddToDoForm {
        return AddToDoForm(delegate: self)
    }
    
    func deleteToDo(sender: UITableViewRowAction, index: NSIndexPath) {
        self.deleteToDo(index.row)
        tableView.deleteRowsAtIndexPaths([index], withRowAnimation: .Right)
    }
    
    func moveToDoToNextState(sender: UITableViewRowAction, index: NSIndexPath) {
        self.moveToDoToNextState(index.row)
        tableView.reloadRowsAtIndexPaths([index], withRowAnimation: .Right)
    }
    
    private func deleteToDo(index: Int) {
        service.removeToDo(atIndex: index)
    }
    
    private func moveToDoToNextState(index: Int) {
        service.moveToDoToNextState(index: index)
    }
    
    private func addToDo(description: String) {
        service.addToDo(description)
    }
    
    // MARK: AddToDoAlertDelegate
    
    func createNewToDo(description: String) {
        self.addToDo(description)
        let newIndex = NSIndexPath(forRow: self.service.toDoList.items.count - 1, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([newIndex], withRowAnimation: .Automatic)
    }
    
    // MARK: UITableViewDataSource - UITableViewDelegate
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return service.toDoList.items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let item = service.toDoList.items[indexPath.row]
        
        cell.textLabel?.text = item.message
        cell.detailTextLabel?.text = item.state.description
                
        return cell
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let item = service.toDoList.items[indexPath.row]
        let deleteAction: UITableViewRowAction = UITableViewRowAction(style: .Destructive,
                                                                title: "Delete",
                                                                handler: deleteToDo)
        let nextStateAction: UITableViewRowAction = UITableViewRowAction(style: .Normal,
                                                                         title: item.state.next.description,
                                                                         handler: moveToDoToNextState)
        
        if item.state.next != .Finished {
            return [deleteAction, nextStateAction]
        }
        
        return [deleteAction]
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}

