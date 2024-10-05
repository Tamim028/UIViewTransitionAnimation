//
//  UIButton+Extension.swift
//  UIViewTransitionAnimation
//
//  Created by Tamim Dari Chowdhury on 10/5/24.
//

import UIKit

extension UIButton {
    func showSelectionUI(){
        self.layer.borderWidth = 5
        self.layer.borderColor = UIColor.yellow.cgColor
    }
    
    func showDeselectionUI(){
        self.layer.borderWidth = 0
        self.layer.borderColor = UIColor.clear.cgColor
    }
}
