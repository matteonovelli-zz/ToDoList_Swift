//
//  AppDelegate.swift
//  todolist
//
//  Created by Matteo on 12/7/16.
//  Copyright © 2016 Openfinance. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let navigationController: UINavigationController = window?.rootViewController as! UINavigationController
        let rootController: ViewController =  navigationController.viewControllers[0] as! ViewController
        
        let toDoList = ToDoList()
        let toDoService = ToDoService(toDoList: toDoList)
        let addToDoForm = AddToDoForm(delegate: rootController)
        
        rootController.service = toDoService
        rootController.addToDoForm = addToDoForm
        
        return true
    }

}

