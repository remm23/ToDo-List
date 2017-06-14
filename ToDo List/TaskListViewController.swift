//
//  TaskListViewController.swift
//  ToDo List
//
//  Created by Remi Tobias on 13/06/2017.
//  Copyright © 2017 Remi Tobias. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var taskList: UITableView!
    
    var tasks: [Task] = []
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasks = makeTasks()
        
        self.taskList.dataSource = self
        self.taskList.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(tasks.count)
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️\(task.name)"
        }else{
            cell.textLabel?.text = task.name
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "completeSegue", sender: task)
    }
    
    func makeTasks() -> [Task]{
        let task1 = Task()
        task1.name = "Walk the dog"
        task1.important = true
        
        let task2 = Task()
        task2.name = "Wash the dishes"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Call the cable company"
        task3.important = false
        
        return [task1,task2,task3]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue" {
            let createTaskVC = segue.destination as! CreateTaskViewController
            createTaskVC.taskListVC = self
        }
        
        if segue.identifier == "completeSegue" {
            let completeTaskVC = segue.destination as! CompleteTaskViewController
            completeTaskVC.taskListVC = self
            completeTaskVC.task = sender as! Task
        }
    }
    
    @IBAction func addTaskTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }

}













