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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.taskList.dataSource = self
        self.taskList.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //This function gets called everytime this view appears on the screen
        getTasks()
        taskList.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(tasks.count)
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️\(task.name!)"
        }else{
            cell.textLabel?.text = task.name!
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "completeSegue", sender: task)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "completeSegue" {
            let completeTaskVC = segue.destination as! CompleteTaskViewController
            completeTaskVC.task = (sender as! Task)
        }
    }
    
    func getTasks() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            try tasks = context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
        } catch {
            print("No context to ferch")
        }
    }
    
    @IBAction func addTaskTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }

}













