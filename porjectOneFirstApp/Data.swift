//
//  Data.swift
//  porjectOneFirstApp
//
//  Created by Israel Manzo on 11/15/16.
//  Copyright © 2016 Israel Manzo. All rights reserved.
//

import Foundation
import UIKit


var lists = [List]()
var availableList: List?

var selectedListIndex: Int = 0

class List {
    
    var title = String()
    var items = [Item]()
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
    
    
}
