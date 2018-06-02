//
//  ListItemTV+Helper+Extension.swift
//  porjectOneFirstApp
//
//  Created by Israel Manzo on 6/1/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

extension ListItemViewController: UITableViewDelegate, UITableViewDataSource {
    
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
