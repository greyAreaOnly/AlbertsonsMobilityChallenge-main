//
//  UIViewControllerExtensions.swift
//  AlbertsonsMobilityChallenge
//
//  Created by Osagie Obaze on 1/3/22.
//

import UIKit

extension UIViewController {
    
    func presentAlert(with message: String) {
        let alert = UIAlertController(title: "Uh Oh!", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Thanks", style: .default, handler: nil)
        alert.addAction(action)
        
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
}
