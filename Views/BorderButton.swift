//
//  BorderButton.swift
//  calculator
//
//  Created by tarek bahie on 1/13/19.
//  Copyright © 2019 tarek bahie. All rights reserved.
//

import UIKit

@IBDesignable class BorderButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1.0
        layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2556453339)
    }

}
