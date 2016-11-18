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
    
    @IBAction func addButton(_ sender: UIButton) {
        
        let newList = List(title: imputTextField.text!)
        lists.append(newList)
        selectedListIndex = lists.count
        tableViewOutlet.reloadData()
        imputTextField.resignFirstResponder()
        
    }
    
    
    var myItem = "firstCell"
    
    
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
    }
    // MARK: This function prepares the data to go to the display controller
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let listItemViewController = segue.destination as! ListItemViewController
        listItemViewController.selectedList = lists[(tableViewOutlet.indexPathForSelectedRow?.row)!]
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            lists.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        }
    }
    
}
