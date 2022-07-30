//
//  UIImageExt.swift
//  CatsTower
//
//  Created by Valeria Henao on 30/07/22.
//

import Foundation
import UIKit

extension UIImage {
    
    static func customImage(name: String) -> UIImage {
        let image = UIImage(named: name)
        assert(image != nil, "Can't load image: \(name)")
        return image ?? UIImage.init()
    }
    
    static func heartIcon() -> UIImage{
        return customImage(name: "heart_icon")
    }
    
    static func breakHeartIcon() -> UIImage{
        return customImage(name: "broken_heart") 
    }
}
