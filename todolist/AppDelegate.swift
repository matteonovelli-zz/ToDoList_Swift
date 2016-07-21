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
//        guard normalExecutionPath() else {
//            window = nil
//            return false
//        }
        
        let navigationController: UINavigationController = window?.rootViewController as! UINavigationController
        let rootController: ViewController =  navigationController.viewControllers[0] as! ViewController
        
        let toDoService = ToDoService()
        rootController.service = toDoService    
        
        return true
    }
    
//    private func normalExecutionPath() -> Bool {
//        return NSClassFromString("XCTestCase") == nil
//    }

}

