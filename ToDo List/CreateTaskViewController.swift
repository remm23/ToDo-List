//
//  CreateTaskViewController.swift
//  ToDo List
//
//  Created by Remi Tobias on 14/06/2017.
//  Copyright © 2017 Remi Tobias. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {
    
    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    //refrence for the task list view controller
    var taskListVC = TaskListViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func AddTask(_ sender: Any) {
        let task = Task()
        task.name = taskName.text!
        task.important = importantSwitch.isOn
//        var check = "abcdefghijklmnopqrstuvwxyz"
        
        //add new task to the array in the task list view controller
        if task.name != ""{
            taskListVC.tasks.append(task)
            taskListVC.taskList.reloadData()
            navigationController!.popViewController(animated: true)
        }
    }
}
