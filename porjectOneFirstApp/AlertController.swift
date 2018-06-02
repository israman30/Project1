//
//  AlertController.swift
//  porjectOneFirstApp
//
//  Created by Israel Manzo on 6/1/18.
//  Copyright © 2018 Israel Manzo. All rights reserved.
//

import UIKit

class AlertController {
    
    static func createAlert(vc: UIViewController, title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        
        vc.present(alert, animated: true, completion: nil)
    }
}
