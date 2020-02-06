//
//  TextFieldDelegate.swift
//  Meme
//
//  Created by MacAir11 on 2019/10/6.
//  Copyright © 2019 Udacity. All rights reserved.
//

import Foundation
import UIKit

// MARK: - TextFieldDelegate: NSObject, UITextFieldDelegate

class TextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        textField.textAlignment = .center
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
        return newText.length > 0
    }
    
}
