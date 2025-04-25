//
//  UIView+Extensions.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 25/04/2025.
//

import UIKit

public extension UIView {
    
    static var nib: UINib {
        let nibName = fileNameForNib
        return UINib(nibName: nibName, bundle: Bundle(for: self))
    }

    static var fileNameForNib: String {
        let identifier = String(describing: self)
        if Bundle(for: self).path(forResource: identifier, ofType: "nib") != nil {
            return identifier
        } else {
            return identifier // fallback is same
        }
    }

    static var identifier: String {
        return String(describing: self)
    }
}

