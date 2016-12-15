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
   
    var selectedTask: Item! // This line save all the data from the List of Items Table View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = selectedTask.title
        descriptionTextField.text = selectedTask.description1
        
        // This lines give the radius corner of the UI Text View
        descriptionTextField.layer.cornerRadius = descriptionTextField.frame.standardized.width / 2
        descriptionTextField.clipsToBounds = true
        descriptionTextField.layer.masksToBounds = true
        descriptionTextField.layer.cornerRadius = 10

    }

    // This function will save the data entered in the text view
    @IBAction func saveDetail(_ sender: UIBarButtonItem) {
        selectedTask.description1 = descriptionTextField.text
        Model.shared.persistListToDefaults()
        
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
