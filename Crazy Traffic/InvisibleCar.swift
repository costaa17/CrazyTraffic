//
//  InvisibleCar.swift
//  Crazy Traffic
//
//  Created by Ana Vitoria do Valle Costa on 2/21/16.
//  Copyright © 2016 Ana Vitoria do Valle Costa. All rights reserved.
//

import Foundation
import SpriteKit

class InvisibleCar: SKSpriteNode {
    weak var parentCar: Cars?

    init() {
        let size = CGSizeMake(10, 10)
        let rect = CGRectMake(0, 0, size.width, size.height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        // make it invisible (alpha: 0)
        //UIColor(red: 102/255.0, green: 51/255.0, blue: 0.0, alpha: 0.0).setFill()
        
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let texture = SKTexture(image: image)

        super.init(texture: texture, color: UIColor.redColor(), size: texture.size())
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}