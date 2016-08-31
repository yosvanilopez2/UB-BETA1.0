//
//  MaterialTextField.swift
//  UB-BETA1.0
//
//  Created by Yosvani Lopez on 8/30/16.
//  Copyright © 2016 Yosvani Lopez. All rights reserved.
//

import UIKit

class MaterialTextField: UITextField {
    override func awakeFromNib() {
        layer.cornerRadius = 2.0
        layer.borderColor = UIColor(red: SHADOW_COLOR, green: SHADOW_COLOR, blue: SHADOW_COLOR, alpha: 0.5).cgColor
        layer.borderWidth = 1.0
    }
    // for placeholder
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }
    
   // for editable text 
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 0)
    }

}
