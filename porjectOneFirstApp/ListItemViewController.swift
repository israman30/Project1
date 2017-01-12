//
//  ListItemViewController.swift
//  porjectOneFirstApp
//
//  Created by Israel Manzo on 11/16/16.
//  Copyright © 2016 Israel Manzo. All rights reserved.
//

import UIKit
import Firebase

class ListItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    @IBOutlet weak var inputTextOutlet: UITextField!
    
    var selectedList: List! // This line contain the value of List of list
    
    var cellID = "secondCell"
    
    @IBAction func tapButton(_ sender: UIButton) {
        let otherItem = Item(title: inputTextOutlet.text!, description: "")
        selectedList.items.append(otherItem)
        tableViewOutlet.reloadData()
        inputTextOutlet.resignFirstResponder()
//        createTask(item: otherItem)   // you are passing in an item
    }
    
    func createTask(item: String){  // you are taking a snapshot here
        if let itemTitle = inputTextOutlet.text, !itemTitle.isEmpty {
        let taskRef = selectedList.ref
        let item = Item(item: itemTitle)
        let itemRef = taskRef?.child(itemTitle)
            itemRef?.setValue(item.toAnyObject)
        }
    }
    
    /*
     func createItem(itemTitle: String) {
     //if let itemTitle = ItemTextFieldOutlet.text, !itemTitle.isEmpty {
     let listRef = lists[currentItemIndex].ref
     let item = Item(itemTitle: itemTitle)
     let itemRef = listRef?.child(itemTitle)
     itemRef?.setValue(item.toAnyObject())
     //}
     }     */
    
    
    func didUpdatedItems(snapshot: FIRDataSnapshot) {
        lists.removeAll()
        for items in snapshot.children {
            let tasks = Item(snapshot: items as! FIRDataSnapshot)
          selectedList.items.append(tasks)
        }
        let item = Item(snapshot: description as! FIRDataSnapshot)
        DispatchQueue.main.async {
            self.tableViewOutlet.reloadData()
        }
    }

    func listenForItems() {
        let item = selectedList.ref
        item?.observe(.value, with: didUpdatedItems)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listenForItems()

    }
    
    // MARK: Data source and Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedList.items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! SecondTableViewCell
        
        cell.nameLabel.text = selectedList.items[indexPath.row].title
        return cell
    }
    
    
    //MARK: This function will be take the values and segue to the next veiw controller
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let descriptionViewController = segue.destination as! DescriptionViewController
        descriptionViewController.selectedTask = selectedList.items[(tableViewOutlet.indexPathForSelectedRow?.row)!]
    }
    
    
    // MARK: This function will delete a row used on the table view
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            selectedList.items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableViewRowAnimation.automatic)
        }
    }
}
