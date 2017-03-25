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
    
    @IBOutlet weak var dateTxtField: UITextField!
    
    let datePicker = UIDatePicker()
   
    var selectedTask: Item! // This line save all the data from the List of Items Table View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = selectedTask.title
        descriptionTextField.text = selectedTask.description1
        // This block give the radius corner of the UI Text View
        descriptionTextField.layer.cornerRadius = descriptionTextField.frame.standardized.width / 2
        descriptionTextField.clipsToBounds = true
        descriptionTextField.layer.masksToBounds = true
        descriptionTextField.layer.cornerRadius = 10
        
        createDatePicker()
    }

    
    // MARK: Saving function - data entered in the text view
    @IBAction func saveDetail(_ sender: UIBarButtonItem) {
        
        if descriptionTextField.text != "" {
            selectedTask.description1 = descriptionTextField.text
            Model.shared.persistListToDefaults()
            
            savingDescription()

        } else {
            let alert = UIAlertController(title: "Hey!", message: "Enter a description please", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            print("Save a description please..!")
        }
    }
    
    // MARk: Saving task description function
    func savingDescription(){
        let alert = UIAlertController(title: "Yay!", message: "You just saved your Chalkboard detail", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: Keyboard dismiss when touch outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func createDatePicker(){
    
        // Format for picker
        datePicker.datePickerMode = .dateAndTime
        datePicker.setValue(UIColor.white, forKey: "textColor")
        datePicker.backgroundColor = .black
        
        
        // Tool bar for date picker
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        toolBar.barTintColor = UIColor.black
        
        // Tool button for date picker
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolBar.setItems([doneButton], animated: false)
        
        doneButton.tintColor = UIColor.white
        
        dateTxtField.inputAccessoryView = toolBar
        dateTxtField.inputView = datePicker
    }
    
    func donePressed(){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
    
        dateTxtField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    
    /*
    func createDatePicker() {
        
        datePicker.datePickerMode = .dateAndTime
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)
        
        deadline.inputAccessoryView = toolbar
        deadline.inputView = datePicker
    }
    
    func donePressed() {
        deadline.text = "\(datePicker.date.prettyLocaleFormattedWithTime)"
        self.view.endEditing(true)
    }
   */
}
