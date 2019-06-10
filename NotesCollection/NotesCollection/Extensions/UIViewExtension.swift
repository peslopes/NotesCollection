//
//  UIViewExtension.swift
//  NotesCollection
//
//  Created by Luiz Pedro Franciscatto Guerra on 08/06/19.
//  Copyright © 2019 Pedro. All rights reserved.
//

import UIKit

extension UIView {
    
    func addButtonTypeShaddow () {
        clipsToBounds = false
        layer.shadowOpacity = 0.25
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    func addNoteTypeShaddow () {
        clipsToBounds = false
        layer.shadowOpacity = 0.25
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 2
        layer.shadowOffset = CGSize(width: 0, height: 2)
    }
    
    func roundTop () {
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
    }
    
    func roundBottom () {
        self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
    }
    
}
