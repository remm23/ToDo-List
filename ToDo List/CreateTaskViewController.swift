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
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func AddTask(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = Task(context: context)
        task.name = taskName.text!
        task.important = importantSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
//        var check = "abcdefghijklmnopqrstuvwxyz"
        
        if task.name != ""{
            // Pop back to TaskList
            navigationController!.popViewController(animated: true)
        }
    }
}
