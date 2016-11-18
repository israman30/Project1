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
   
    var selectedTask: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = selectedTask.title
        descriptionTextField.text = selectedTask.description
        
        descriptionTextField.layer.cornerRadius = descriptionTextField.frame.standardized.width / 2
        descriptionTextField.clipsToBounds = true
        descriptionTextField.layer.masksToBounds = true
        descriptionTextField.layer.cornerRadius = 10

    }

    @IBAction func saveDetail(_ sender: UIBarButtonItem) {
        selectedTask.description = descriptionTextField.text
        
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
