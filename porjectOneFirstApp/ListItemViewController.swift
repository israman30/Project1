//
//  ListItemViewController.swift
//  porjectOneFirstApp
//
//  Created by Israel Manzo on 11/16/16.
//  Copyright © 2016 Israel Manzo. All rights reserved.
//

import UIKit

class ListItemViewController: UIViewController {
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    @IBOutlet weak var inputTextOutlet: UITextField!
    
    var selectedList: List! // This line contain the value of List of list
    
    var cellID = "secondCell" // Cell ID
    
    // MARK: Button saves the Task list
    @IBAction func tapButton(_ sender: UIButton) {
        
        if inputTextOutlet.text != "" {
            guard let titleTaskText = inputTextOutlet.text else {return}
            let otherItem = Item(title: titleTaskText, description1: "", date: "")
            selectedList.items.append(otherItem)
            tableViewOutlet.reloadData()
            inputTextOutlet.resignFirstResponder()
            Model.shared.persistListToDefaults()
            inputTextOutlet.text = ""
            
        } else {
            AlertController.createAlert(vc: self, title: "Sorry!", message: "Please enter a list name")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Rounding table view corners
        tableViewOutlet.layer.cornerRadius = 6
    }
    
    // MARK: ViewDidload reload the table view after the description data is saved on Description VC
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableViewOutlet.reloadData()
    }
    
    // MARK: Keyboard dismiss when touch outside 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: This function will be take the values and segue to the next veiw controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let descriptionViewController = segue.destination as! DescriptionViewController
        descriptionViewController.selectedTask = selectedList.items[(tableViewOutlet.indexPathForSelectedRow?.row)!]
    }
    
}




