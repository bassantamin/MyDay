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
   
      let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask) .first?.appendingPathComponent("Items.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        print(dataFilePath)
        
        
        
   loadItems()
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
        
       saveItems()
        
     
        
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
        self.saveItems()
       
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Creat new item"
            
            textField = alertTextField
     
            
          
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    //Mark - Model Manuptlation Methods
    
    func saveItems() {
        
        let encoder = PropertyListEncoder()
        
        do{
            let data = try  encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error In Coding Item Array, \(error)")
        }
        self.tableView.reloadData()
        
    }
    func  loadItems() {
      if  let data = try? Data (contentsOf: dataFilePath!){
            let decoder = PropertyListDecoder()
        do{
        itemArray = try decoder.decode([Item].self , from: data)
        } catch {
            print("Error In decoding Item Array, \(error)")
        }
        }
    }
}

