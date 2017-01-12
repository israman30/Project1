//
//  LoLViewController.swift
//  porjectOneFirstApp
//
//  Created by Israel Manzo on 11/15/16.
//  Copyright © 2016 Israel Manzo. All rights reserved.
//

import UIKit
import Firebase

class LoLViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var lists = [List]()
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBAction func addButton(_ sender: UIButton) {
        
        let newList = List(title: inputTextField.text!)
        lists.append(newList)
        selectedListIndex = lists.count
        tableViewOutlet.reloadData()
        createList(title: inputTextField.text!)
    }
    
    func createList(title: String) {
        
        let listsRef = FIRDatabase.database().reference(withPath: "lists")
        let list = List(title: title)
        let listRef = listsRef.child(title)
        listRef.setValue(list.toAnyObject())
    }
    
    func updateLists(newTitle: String, items: [Item], list: List) {
        if list.title == newTitle {
            list.ref?.updateChildValues(["items" : [Item].self])
        } else {
            list.ref?.removeValue()
            createList(title: newTitle)
        }
    }
    func didUpdatedList(snapshot: FIRDataSnapshot) {
        lists.removeAll()
        for item in snapshot.children {
            let list = List(snapshot: item as! FIRDataSnapshot)
            self.lists.append(list)
        }
        DispatchQueue.main.async {
            self.tableViewOutlet.reloadData()
        }
        
    }

    func listenForLists() {
        let lists = FIRDatabase.database().reference(withPath: "lists")
        lists.observe(.value, with: didUpdatedList)
    }
    
    func deleteList(list: List) {
        list.ref?.removeValue()
    }
    

    //MARK: Data Source and Delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath) as! FirstTableViewCell
        
        cell.nameLabel.text = lists[indexPath.row].title
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listenForLists()
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
