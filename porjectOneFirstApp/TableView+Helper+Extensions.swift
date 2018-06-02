//
//  TableView+Helper+Extensions.swift
//  porjectOneFirstApp
//
//  Created by Israel Manzo on 6/1/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

extension LoLViewController: UITableViewDataSource, UITableViewDelegate {
    
    //MARK: Data Source and Delegates
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: myItem, for: indexPath) as! FirstTableViewCell
        
        let titleList = lists[indexPath.row].title
        cell.nameLabel.text = titleList
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    // This function delete a row from the table view
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            lists.remove(at: indexPath.row)
            let defaults = UserDefaults.standard
            tableView.deleteRows(at: [indexPath as IndexPath], with: .fade)
            defaults.removeObject(forKey: "title")
            defaults.synchronize()
            Model.shared.persistListToDefaults()
            
        } else {
            tableViewOutlet.reloadData()
        }
    }
}
