//
//  ListItemViewController.swift
//  porjectOneFirstApp
//
//  Created by Israel Manzo on 11/16/16.
//  Copyright © 2016 Israel Manzo. All rights reserved.
//

import UIKit

class ListItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    @IBOutlet weak var inputTextOutlet: UITextField!
    
    var selectedList: List! // This line contain the value of List of list
    
    var cellID = "secondCell"
    
    @IBAction func tapButton(_ sender: UIButton) {
        let otherItem = Item(title: inputTextOutlet.text!, description1: "")
        selectedList.items.append(otherItem)
        tableViewOutlet.reloadData()
        inputTextOutlet.resignFirstResponder()
        Model.shared.persistListToDefaults()
        inputTextOutlet.text = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
