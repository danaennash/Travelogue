//
//  ErrorHandler.swift
//  DocumentsCoreRelationships
//
//  Created by Danae N Nash on 12/4/19.
//  Copyright © 2018 Danae N Nash. All rights reserved.//

import Foundation
import UIKit

func createFailAlert(message: String, error: String, parent: Any){
    let alert = UIAlertController(title: message, message: error, preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    
    if let parent = parent as? UIViewController {
        parent.present(alert, animated: true, completion: nil)
    }
    
    if let parent = parent as? UITableViewController {
        parent.present(alert, animated: true, completion: nil)
    }
}
