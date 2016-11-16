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
    
    var cellID = "secondCell"
    
    @IBAction func tapButton(_ sender: UIButton) {
        let otherItem = Item.init(title: inputTextOutlet.text!, description: "")
        lists[selectedListIndex].items.append(otherItem)
        tableViewOutlet.reloadData()
        inputTextOutlet.resignFirstResponder()
        
        
    }
    
    var selectedListIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists[selectedListIndex].items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! SecondTableViewCell
        
        cell.nameLabel.text = lists[selectedListIndex].items[indexPath.row].title
        return cell
    }
    
    
    //MARK: this function will be take the values and segue to the next veiw controller
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let descriptionData = segue.destination as! DescriptionViewController
        descriptionData.selectedTaskIndex = tableViewOutlet.indexPathForSelectedRow?.row
    }
}
