//
//  CompleteTaskViewController.swift
//  ToDo List
//
//  Created by Remi Tobias on 14/06/2017.
//  Copyright © 2017 Remi Tobias. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    @IBOutlet weak var taskLabel: UILabel!
    var task: Task? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskLabel.text = task!.name
    }
    
    
    @IBAction func completeTaskTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }

}
