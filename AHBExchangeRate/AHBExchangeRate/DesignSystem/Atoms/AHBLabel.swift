//
//  AHBLabel.swift
//  AHBExchangeRate
//
//  Created by Ahmad Jabri on 24/04/2025.
//

import UIKit

public class AHBLabel: UILabel {
    
    // MARK: - Props
    public var style: AHBLabelStyle? = .header {
        didSet {
            updateStyle()
        }
    }
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        commonInit()
    }
    
    // MARK: - Common initializer
    func commonInit() {
        updateStyle()
    }
}

private extension AHBLabel {
    func updateStyle() {
        font = style?.font
        textColor = style?.textColor
    }
}
