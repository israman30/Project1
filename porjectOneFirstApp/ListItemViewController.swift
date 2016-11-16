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
    
    var selectedList: List!
    
    var cellID = "secondCell"
    
    @IBAction func tapButton(_ sender: UIButton) {
        let otherItem = Item(title: inputTextOutlet.text!, description: "")
        selectedList.items.append(otherItem)
        tableViewOutlet.reloadData()
        inputTextOutlet.resignFirstResponder()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedList.items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! SecondTableViewCell
        
        cell.nameLabel.text = selectedList.items[indexPath.row].title
        return cell
    }
    
    
    //MARK: this function will be take the values and segue to the next veiw controller
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let descriptionViewController = segue.destination as! DescriptionViewController
        descriptionViewController.selectedTask = selectedList.items[(tableViewOutlet.indexPathForSelectedRow?.row)!]
    }
}
