//
//  ViewController.swift
//  SearchListApp
//
//  Created by user145527 on 11/14/18.
//  Copyright © 2018 user145527. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    //var list = ["item one", "item two", "item three"]
   var list = [Item]()
   
    var defaults = UserDefaults.standard // local save
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        //code using user defualt
        if let newList = defaults.array(forKey: "newItemText") as? [Item] {
            list = newList
        }

        let newItem = Item()
       
        newItem.title = "milk"
        newItem.done = false
        list.append(newItem)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("test: cellforindexpath \(indexPath.row)")
        // adds to table : dequeue
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
        
        cell.textLabel?.text = list[indexPath.row].title
        // added implemented code
        
        //Adding check mark into cells
        if list[indexPath.row].done == true{
            cell.accessoryType = .checkmark
        }else{
           cell.accessoryType = .none
        }
        
       
        
        return cell
        
        
    }
    
    //Mark: tableview touch method
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(list[indexPath.row])
       
        if list[indexPath.row].done == false {
            list[indexPath.row].done = true
            
        }else{
            list[indexPath.row].done = false
            
        }
         tableView.reloadData()
        
        //func to add checkmark
        // reference to cell that is tapeed|| accesory is the icon of type checkmark
     // tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        // allows to set and unselect checkmark
      
        //-- GOt ride od code becasue of implemtionation of top, added to func above

/*        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
         }
*/
        
        tableView.deselectRow(at: indexPath, animated: true)// controls the anitmation
        
        
    }

   
    
    // Mark: add button and allow to add items
    
    // alert, alertAction, add,present
    
    @IBAction func AddButton(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add to list", message: "What would you like to add", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "New item", style: .default) { (alert) in
            // code what happens when addButton is press, bascially the end
            print("passed")
            
            
            let newItem = Item()
            newItem.title = textField.text!
          
            
            self.list.append(newItem)
            // then you need to reload data to get it to show
           
            // sets val with key string identifier
            self.defaults.set(self.list, forKey: "newItemText")//codeSaveTo userDefualt
            self.tableView.reloadData()
            
            
        }
        
        
        // adds a textfield to notifactions, then added place holder
        alert.addTextField { (alerttextfield) in
            alerttextfield.placeholder = "create new item"
           // print(alerttextfield.text!)
            print("inside alert.addtextfiel")
            //self.list.append(alerttextfield.text!)
            textField = alerttextfield
        }
        
        alert.addAction(alertAction)
        present(alert, animated: true, completion: nil)
        
    }
    
}

