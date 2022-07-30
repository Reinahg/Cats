//
//  RoundImage.swift
//  CatsTower
//
//  Created by Valeria Henao on 30/07/22.
//

import Foundation
import UIKit

@IBDesignable class RoundImage : UIImageView{
    @IBInspectable var radius : CGFloat = 0{
        didSet{
            self.applyMask()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.applyMask()
    }
    
    func applyMask()
    {
        clipsToBounds = true
        layer.cornerRadius = radius
    }
}
