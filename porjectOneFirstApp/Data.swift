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
    init(snapshot: FIRDataSnapshot) {
        title = snapshot.key
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        if items.isEmpty {
            return 0
        } else {
            var values = [String :Any]()
            for list in lists {
                values[list.title] = list.toAnyObject()
            }
            return [title: values]
        }
    }
}

class Item {
    var title: String
    var description: String
    var ref: FIRDatabaseReference?
   
    init(title:String, description: String) {
        self.title = title
        self.description = description
    }
    
    init(snapshot: FIRDataSnapshot) {
        title = snapshot.key
        let newList = snapshot.value as! [String : Any]
        description = newList["description"] as! String
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any {
        return  description
    }
}
