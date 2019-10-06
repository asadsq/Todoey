//
//  ViewController.swift
//  Todoey
//
//  Created by Asad Qureshi on 10/5/19.
//  Copyright © 2019 Asad Qureshi. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    let itemArray : [String] = ["Find Mike", "Destroy Demodogs", "Buy Eggos"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK *** Table View Datasource methods ***
    
    
    
    // method for - what each cell will display
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
        
    }
    
    // method for - num of rows to be shown in this table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    // MARK -- Table View Delegate methods
    
    
    
    // method - what happens when you click on a cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // prints the current item selected
        print (itemArray[indexPath.row])
        
        // let's try to the check box stuff now...
        
        // if cell is selected, add a check box
        if (tableView.cellForRow(at: indexPath)?.accessoryType != .checkmark) {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        
        // add some animation to make sure the row does not stay selected, when you click it
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
