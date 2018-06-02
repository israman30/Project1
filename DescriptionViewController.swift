//
//  DescriptionViewController.swift
//  porjectOneFirstApp
//
//  Created by Israel Manzo on 11/16/16.
//  Copyright © 2016 Israel Manzo. All rights reserved.
//

import UIKit
import UserNotifications

class DescriptionViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var descriptionTextField: UITextView!
    
    @IBOutlet weak var dateTxtField: UITextField!
    
    var datePicker = UIDatePicker()
   
    var selectedTask: Item! // This line save all the data from the List of Items Table View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionLabel.text = selectedTask.title
        descriptionTextField.text = selectedTask.description1
        dateTxtField.text = selectedTask.date
        // This block give the radius corner of the UI Text View
        createDatePicker()
        updateDetailTextView()
    }
    
    // MARK: Saving function - data entered in the text view
    @IBAction func saveDetail(_ sender: UIBarButtonItem) {
        
        guard let descriptionDetail = descriptionTextField.text else {return}
        guard let dateDetail = dateTxtField.text else {return}
        
        if descriptionDetail != "" || dateDetail != "" {
            selectedTask.description1 = descriptionDetail
            selectedTask.date = dateDetail
            
            Model.shared.persistListToDefaults()
            
            notificationSender(datePicker)
            savingDescription()
            
        } else {
            AlertController.createAlert(vc: self, title: "Hey!", message: "Enter a description please")
        }
    }
    
    func updateDetailTextView(){
        descriptionTextField.layer.cornerRadius = descriptionTextField.frame.standardized.width / 2
        descriptionTextField.clipsToBounds = true
        descriptionTextField.layer.masksToBounds = true
        descriptionTextField.layer.cornerRadius = 6
    }
    
    // MARK: Creating a date picker
    func createDatePicker(){
        // Custom the picker
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
    
    // MARk: Saving task description function
    func savingDescription(){
        AlertController.createAlert(vc: self, title: "Yay!", message: "You just saved your Chalkboard detail")
    }
    
    // MARK: Keyboard dismiss when touch outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: Calling User Notifications
    func notificationSender(_ sender: UIDatePicker) {
        let selectedDate = sender.date
        print("Selected Date is : \(selectedDate)")
        let delegate = UIApplication.shared.delegate as? AppDelegate
        delegate?.scheduleNotification(at: selectedDate)
    }
    
}


