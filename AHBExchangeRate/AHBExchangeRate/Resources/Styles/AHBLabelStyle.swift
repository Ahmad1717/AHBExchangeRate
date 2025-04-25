//
//  AHBLabelStyle.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 25/04/2025.
//

import UIKit

public struct AHBLabelStyle {
    public var textColor: UIColor
    public var font: UIFont
}


extension AHBLabelStyle {
    /// dark/Header1
    public static var header: AHBLabelStyle {
        AHBLabelStyle(textColor: UIColor.black,
                      font: UIFont.boldSystemFont(ofSize: 17)) // Bold and larger
    }

    /// subtitle
    public static var subtitle: AHBLabelStyle {
        AHBLabelStyle(textColor: UIColor.gray,
                      font: UIFont.systemFont(ofSize: 13)) // Regular and smaller
    }
    
    /// Green for positive change
        public static var positiveChange: AHBLabelStyle {
            AHBLabelStyle(textColor: UIColor.systemGreen,
                          font: UIFont.systemFont(ofSize: 13, weight: .medium))
        }

        /// Red for negative change
        public static var negativeChange: AHBLabelStyle {
            AHBLabelStyle(textColor: UIColor.systemRed,
                          font: UIFont.systemFont(ofSize: 13, weight: .medium))
        }
}
