//
//  Data.swift
//  porjectOneFirstApp
//
//  Created by Israel Manzo on 11/15/16.
//  Copyright © 2016 Israel Manzo. All rights reserved.
//

import Foundation
import UIKit

class Model {
    
static let shared = Model()
    
    private init(){}
    
    let key = "Persisted-List)"
    
    func persistListToDefaults() {
        
        let data = NSKeyedArchiver.archivedData(withRootObject: lists)
        UserDefaults.standard.set(data, forKey: key)
    }
    
    func loadPersistedListFromDefaults() {
        
        if let data = UserDefaults.standard.object(forKey: key) as? Data {
            let peps = NSKeyedUnarchiver.unarchiveObject(with: data) as! [List]
           lists = peps
        }
    }
}

var lists = [List]()
var availableList: List?

var selectedListIndex: Int!

class List: NSObject, NSCoding {
    
    private struct Keys {
    
        static let title = "title"
        static let items = "items"
    }
    
    var title: String
    var items = [Item]()
    
    init(title: String) {
        self.title = title
    }
    required init?(coder aDecoder: NSCoder) {
            title = aDecoder.decodeObject(forKey: Keys.title) as! String
            items = aDecoder.decodeObject(forKey: Keys.items) as! [Item]
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: Keys.title)
        aCoder.encode(items, forKey: Keys.items)
    }
}

class Item: NSObject, NSCoding {
    
    private struct Keys {
        static let title = "title"
        static let description1 = "description1"
        static let date = "date"
    }
    
    var title: String
    var description1 = "description1"
    var date: String 
    
    init(title: String, description1: String, date: String) {
        
        self.title = title
        self.description1 = description1
        self.date = date
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(
            title: aDecoder.decodeObject(forKey: Keys.title) as! String,
            description1: aDecoder.decodeObject(forKey: Keys.description1) as! String,
            date: aDecoder.decodeObject(forKey: Keys.date) as! String
            )
    }
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(title, forKey: Keys.title)
        aCoder.encode(description1, forKey: Keys.description1)
        aCoder.encode(date, forKey: Keys.date)
    }
    
}
