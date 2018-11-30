//
//  MyViewControllerExtension.swift
//  TrackandTrace
//
//  Created by Supakorn Thitivarangkool on 5/10/2561 BE.
//  Copyright © 2561 Kerry Express. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func alert(message: String, title: String = "", button: String = "alert.close".localized) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: button, style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alert1Button(message: String, title: String = "", button1: UIAlertAction, cancelTitle: String = "alert.cancel".localized) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: nil)
        alertController.addAction(button1)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alert2Button(message: String, title: String = "", button1: UIAlertAction, button2: UIAlertAction, cancelTitle: String = "alert.cancel".localized) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: nil)
        alertController.addAction(button1)
        alertController.addAction(button2)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func alert3Button(message: String, title: String = "", button1: UIAlertAction, button2: UIAlertAction, button3: UIAlertAction, cancelTitle: String = "alert.cancel".localized) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: nil)
        alertController.addAction(button1)
        alertController.addAction(button2)
        alertController.addAction(button3)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}
