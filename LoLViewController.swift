//
//  LoLViewController.swift
//  porjectOneFirstApp
//
//  Created by Israel Manzo on 11/15/16.
//  Copyright © 2016 Israel Manzo. All rights reserved.
//

import UIKit

class LoLViewController: UIViewController {
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    @IBOutlet weak var imputTextField: UITextField!
    
    var myItem = "firstCell" // Cell ID
    
    // MARK: Button saves List
    @IBAction func addButton(_ sender: UIButton) {
        
        if imputTextField.text != "" {
            guard let inputText = imputTextField.text else {return}
            let newList = List(title: inputText)
            lists.append(newList)
            selectedListIndex = lists.count
            tableViewOutlet.reloadData()
            imputTextField.resignFirstResponder()
            Model.shared.persistListToDefaults()
            imputTextField.text = ""
            
        } else {
            AlertController.createAlert(vc: self, title: "Sorry!", message: "Please enter a list name")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewOutlet.layer.cornerRadius = 6
    }
    
    // MARK: ViewWillAppear will update and custom the Navigation Controller
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.titleTextAttributes = [
            NSFontAttributeName: UIFont(name:"Marker Felt", size:20.0)!, NSForegroundColorAttributeName:UIColor.white
        ]
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
    
    
}


