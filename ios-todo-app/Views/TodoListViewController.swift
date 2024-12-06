//
//  TodoListViewController.swift
//  ios-todo-app
//
//  Created by Hridayan Phukan on 06/12/24.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [
        "Find Mike", "Buy Eggs", "Go to gym"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }
    
    //MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _ = tableView.cellForRow(at: indexPath)
        _ = itemArray[indexPath.row]
        
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add new items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Item", message: nil, preferredStyle: .alert)
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Enter Item"
            textField = alertTextField
        }
        
        let action = UIAlertAction(title: "Add Item", style: .default) { action in
            print(textField.text ?? "")
            
            self.itemArray.append(textField.text ?? "")
            
            self.tableView.reloadData()
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
}
