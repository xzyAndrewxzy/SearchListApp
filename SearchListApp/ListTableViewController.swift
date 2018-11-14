//
//  ViewController.swift
//  SearchListApp
//
//  Created by user145527 on 11/14/18.
//  Copyright © 2018 user145527. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    var list = ["item one", "item two", "item three"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // adds to table : dequeue
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
        
        
    }
    
    //Mark: tableview touch method
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(list[indexPath.row])
       
        //func to add checkmark
        // reference to cell that is tapeed|| accesory is the icon of type checkmark
     // tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        // allows to set and unselect checkmark
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        }
        
        tableView.deselectRow(at: indexPath, animated: true)// controls the anitmation
        
        
    }

   
    
    // Mark: add button and allow to add items
    
    // alert, alertAction, add,present
    
    @IBAction func AddButton(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController.init(title: "Add to list", message: "What would you like to add", preferredStyle: .alert)
        
        let alertAction = UIAlertAction.init(title: "New item", style: .default) { (alert) in
            // code what happens when addButton is press, bascially the end
            print("passed")
            print(textField.text!)
            self.list.append(textField.text!)
            // then you need to reload data to get it to show
            self.tableView.reloadData()
        }
        // adds a textfield
        alert.addTextField { (alerttextfield) in
            alerttextfield.placeholder = "create new item"
            print(alerttextfield.text!)
            print("inside alert.addtextfiel")
            //self.list.append(alerttextfield.text!)
            textField = alerttextfield
        }
        
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
    }
    
}

