//
//  DescriptionViewController.swift
//  porjectOneFirstApp
//
//  Created by Israel Manzo on 11/16/16.
//  Copyright © 2016 Israel Manzo. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var descriptionTextField: UITextView!
   
    var selectedTaskIndex: Int!
    var selectedListIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        descriptionLabel.text! = lists[selectedListIndex].items[selectedTaskIndex].title 
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
