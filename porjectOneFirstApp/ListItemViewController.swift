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
            
            let alert = UIAlertController(title: "Ops!", message: "Please enter a list name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            print("Hey..!! There is not list input..!!!!")
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
    
    // MARK: Data Source and Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedList.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! SecondTableViewCell
        
        let titleTask = selectedList.items[indexPath.row].title
        cell.nameLabel.text = titleTask
        
        let dateTask = selectedList.items[indexPath.row].date
        cell.dateTxtField.text = dateTask
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    //MARK: This function will be take the values and segue to the next veiw controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let descriptionViewController = segue.destination as! DescriptionViewController
        descriptionViewController.selectedTask = selectedList.items[(tableViewOutlet.indexPathForSelectedRow?.row)!]
    }
    
    // MARK: This function will delete a row used on the table view
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            selectedList.items.remove(at: indexPath.row)
            let userDefaults = UserDefaults.standard
            tableView.deleteRows(at: [indexPath as IndexPath], with: .fade)
            
            userDefaults.removeObject(forKey: "description1")
            userDefaults.removeObject(forKey: "title")
            userDefaults.removeObject(forKey: "date")
            
            userDefaults.synchronize()
            Model.shared.persistListToDefaults()
            
        } else {
            tableViewOutlet.reloadData()
        }
    }
}


