//
//  LoLViewController.swift
//  porjectOneFirstApp
//
//  Created by Israel Manzo on 11/15/16.
//  Copyright © 2016 Israel Manzo. All rights reserved.
//

import UIKit

class LoLViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    @IBOutlet weak var imputTextField: UITextField!
    
    var myItem = "firstCell"
    
    @IBAction func addButton(_ sender: UIButton) {
        
        if (imputTextField.text != "") {
            let newList = List(title: imputTextField.text!)
            lists.append(newList)
            selectedListIndex = lists.count
            tableViewOutlet.reloadData()
            imputTextField.resignFirstResponder()
            Model.shared.persistListToDefaults()
            imputTextField.text = ""
        } else {
            let alert = UIAlertController(title: "Ops!", message: "Please enter a list name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            print("The is not list entered")
        }
    }
    
    //MARK: Data Source and Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: myItem, for: indexPath) as! FirstTableViewCell
        
        cell.nameLabel.text = lists[indexPath.row].title
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.layer.cornerRadius = 10
    }
    
    
    // MARK: Keyboard dismiss when touch outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    // MARK: This function prepares the data to go to the display controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let listItemViewController = segue.destination as! ListItemViewController
        listItemViewController.selectedList = lists[(tableViewOutlet.indexPathForSelectedRow?.row)!]
    }
    
    
    // This function delete a row from the table view 
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            lists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        }
    }
}
