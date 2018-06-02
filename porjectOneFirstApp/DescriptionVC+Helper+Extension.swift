//
//  DescriptionVC+Helper+Extension.swift
//  porjectOneFirstApp
//
//  Created by Israel Manzo on 6/1/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

extension DescriptionViewController {
    
    // MARK: Creating a done press button for datePicker tool bar & formatting date
    func donePressed(){
        // Date formatter
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        // Dismissing picker after selected
        dateTxtField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
}
