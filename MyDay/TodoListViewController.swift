//
//  ViewController.swift
//  MyDay
//
//  Created by Bassant Bakir on 1/20/18.
//  Copyright © 2018 Bassant Amin. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Find MIke", "Buy Eggs", "DEstroy Demorgon"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

  //MARK - Tableview Datasource Method

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
     //MARK - Tableview Delegate Method
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print (itemArray[indexPath.row])
      
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            
           tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        }
        else{
              tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
    let alert = UIAlertController(title: "add new myday item", message: "", preferredStyle: .alert)
        
    let action = UIAlertAction(title: "add item", style: .default) { (action) in
        //what will happen once user clicks the DD Item button on our UIalert
        
       self.itemArray.append(textField.text!)
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

