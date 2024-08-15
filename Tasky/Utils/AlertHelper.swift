//
//  AlertHelper.swift
//  Tasky
//
//  Created by Gustavo Ferreira dos Santos on 14/08/24.
//

import UIKit

struct AlertHelper {
    static func showAlert(on viewController: UIViewController, title: String, message: String, actions: [UIAlertAction] = []) {
         let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

         if actions.isEmpty {
             let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
             alert.addAction(okAction)
         } else {
             for action in actions {
                 alert.addAction(action)
             }
         }

         viewController.present(alert, animated: true, completion: nil)
     }
}
