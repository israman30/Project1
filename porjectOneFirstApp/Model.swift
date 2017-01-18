//
//  Model.swift
//  porjectOneFirstApp
//
//  Created by Israel Manzo on 1/12/17.
//  Copyright © 2017 Israel Manzo. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Model {
    
    var lists: [List] {
        
        var ls = [List]()
        
        let req: NSFetchRequest<List> = List.fetchRequest()
        do {
        
            ls = try context.fetch(req)
        } catch{
            print(error)
        }
        return ls
    }
    
    var context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func createLis(title: String){
      let list = List(context: context)
      list.title = title
    
        do {
            try context.save()
            
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func readList(){
        let fetch: NSFetchRequest<List> = List.fetchRequest()
        
        do {
            
            let lists = try context.fetch(fetch)
            let listCount = lists.count
            print(listCount)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func createItem(title: String){
        let item = Item(context: context)
        item.title = title
        
        do {
            try context.save()
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func readItem(){
        let fetch: NSFetchRequest<Item> = Item.fetchRequest()
        
        do {
            let items = try context.fetch(fetch)
            let itemsCount =  items.count
            print(itemsCount)
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
}

