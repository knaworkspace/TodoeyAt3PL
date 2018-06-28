//
//  ViewController.swift
//  Todoey
//
//  Created by 3PL-Total on 2018/6/27.
//  Copyright © 2018年 KNA. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController {

    var itemArray = [Item]()

    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print(dataFilePath)

        loadData()

    }


    //MARK: - Tableview datasource methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = itemArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoListCell", for:indexPath)
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none

        return cell
    }
    
    //Mark: - Tableview delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        saveItem()
    }
    
    //MARK: - Add new item
    
    @IBAction func addBtnPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            
            self.saveItem()
            
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        present(alert, animated: true, completion: nil)
        
    }
    
    //Mark: - Tableview mainpulation methods
    
    func saveItem(){
        let encoder = PropertyListEncoder()
        do{
            let data = try encoder.encode(itemArray)
            try data.write(to:dataFilePath!)
        }catch{
            print("Error encoding item array \(error)")
        }
        tableView.reloadData()
    }
    
    func loadData(){
        
        if let data = try? Data(contentsOf: dataFilePath!){
            let decoder = PropertyListDecoder()
            do{
                itemArray = try decoder.decode([Item].self, from: data)
                
            }catch{
                print("Error decoding item array \(error)")
            }
        }
        tableView.reloadData()
    }
    
    //End of class
}












