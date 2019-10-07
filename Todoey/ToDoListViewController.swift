//
//  ViewController.swift
//  Todoey
//
//  Created by Asad Qureshi on 10/5/19.
//  Copyright © 2019 Asad Qureshi. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    // used for storing data even after app is terminated
    let defaults = UserDefaults.standard
    
    var itemArray : [String] = ["Find Mike", "Destroy Demodogs", "Buy Eggos"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // use the persistent method to make the array display all the data
        
        // btw just to make sure that the array is not empty we use the "if let" apprach
        // that way we can also replace the ! with the ?
        if let items = defaults.array(forKey: "ToDoListArray") as? [String] {
            itemArray = items
        }
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

    
    // MARK -- Add items one by one
    
    
    // what happen when you click the + button
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        // some debugging here
        print ("+ button clicked")
        
        // this is a local var to store the alertTextField contents
        var textField = UITextField()
        
        // create an alert box
        let alert = UIAlertController(title : "Add New Todoey Item", message : "", preferredStyle : .alert)
        
        // create a button that will eventually be added to the alert box
        let action = UIAlertAction(title: "Add Item", style: .default) {
            (action) in
            // what happens once you click this Add item button, inside the alert
            self.itemArray.append(textField.text!)
            
            // now let's try to make the data persist accross different app runs
            // create a key called ToDoListArray
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
            // reload
            self.tableView.reloadData()
        }
        
        // create AND add a text field inside the alert box, for typing out your entry item
        alert.addTextField {
            (alertTextField) in
            
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            
        }

        // add the button/action to the alert box
        alert.addAction(action)
        
        // present the alert
        present(alert, animated: true, completion: nil)
        
    }
    
}
