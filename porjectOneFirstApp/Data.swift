//
//  Data.swift
//  porjectOneFirstApp
//
//  Created by Israel Manzo on 11/15/16.
//  Copyright © 2016 Israel Manzo. All rights reserved.
//

import Foundation
import UIKit
import Firebase


var lists = [List]()
var availableList: List?

var selectedListIndex: Int!

class List {
    
    var title = String()
    var items = [Item]()
    var ref: FIRDatabaseReference?
    init(title: String) {
        self.title = title
    }

    }

class Item {
    var title: String
    var description: String
   
    
    init(title:String, description: String) {
        self.title = title
        self.description = description
    }
    init(listOfList: FIRDataSnapshot) {
        title = listOfList.key
        let newList = listOfList.value as! [String : Any]
        description = newList["description"] as! String
    }
}
