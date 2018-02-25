//
//  ViewController.swift
//  MyDay
//
//  Created by Bassant Bakir on 1/20/18.
//  Copyright © 2018 Bassant Amin. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    let defults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find MIke"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Buy Egg"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Destroy Demogoron"
        itemArray.append(newItem3)
        
        if let items = defults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
       }
    }

  //MARK - Tableview Datasource Method

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt  indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
         //ternary Operator
        // value = condition ? valueIfTrue : valueIfFalse
        cell.accessoryType = item.done ? .checkmark : .none
        
        
        return cell
    }
    
     //MARK - Tableview Delegate Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print (itemArray[indexPath.row])
        
        itemArray[indexPath.row] .done = !itemArray[indexPath.row].done
        
       
        
      tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
    let alert = UIAlertController(title: "add new myday item", message: "", preferredStyle: .alert)
        
    let action = UIAlertAction(title: "add item", style: .default) { (action) in
        //what will happen once user clicks the DD Item button on our UIalert
        let newItem = Item()
        newItem.title = textField.text!
        
        self.itemArray.append(newItem)
        
        self.defults.set(self.itemArray, forKey: "TodoListArray")
        
        self.tableView.reloadData()
            
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Creat new item"
            
            textField = alertTextField
     
            
          
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
}
