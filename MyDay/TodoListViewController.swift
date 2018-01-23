//
//  ViewController.swift
//  MyDay
//
//  Created by Bassant Bakir on 1/20/18.
//  Copyright © 2018 Bassant Amin. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Find MIke", "Buy Eggs", "DEstroy Demorgon"]
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
    
    
}

