//
//  Cars.swift
//  Crazy Traffic
//
//  Created by Ana Vitoria do Valle Costa on 1/8/16.
//  Copyright © 2016 Ana Vitoria do Valle Costa. All rights reserved.
//

import Foundation
import SpriteKit
enum Type {
    case road
    case rail
    case walk
    case cross
    case crazyPedestrian
}

class Cars: SKSpriteNode{
    
    var gotInScreen: Bool
    var carSpeed: CGFloat
    var type = Type.road
    var iCar = InvisibleCar()
    var path: Path?
    var stopBool = false
    var speedUpBool = false

    let invisibleCarCategory: UInt32 = 0x1 << 2
    let carCategory: UInt32 = 0x1 << 0


    
    init(texture: SKTexture?) {
        carSpeed = 5
        gotInScreen = false
        super.init(texture: texture, color: UIColor.whiteColor(), size: texture!.size())
        iCar.parentCar = self

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startAction(path: Path){
        // Set car to start following path, wait 1.3 seconds, then start the iCar following path
        self.path = path
        self.size = CGSizeMake(self.size.width/2, self.size.height/2)
        self.runAction(SKAction.unhide())
        self.runAction(SKAction.followPath(path.buildCGPath(), asOffset:false, orientToPath:true, speed:carSpeed), withKey: "moving")
        iCar.runAction(SKAction.unhide())
        iCar.runAction(SKAction.followPath(path.buildCGPath(), asOffset:false, orientToPath:true, speed:carSpeed), withKey: "moving2")
        let movingAction2 = iCar.actionForKey("moving2")
        let movingAction = self.actionForKey("moving")
        movingAction2?.speed = 0.0
        movingAction?.speed = carSpeed
        let wait = SKAction.waitForDuration(1.3)
        let block = SKAction.runBlock({
            //Unpause the action
            movingAction2?.speed = self.carSpeed
        })
        let sequence = SKAction.sequence([wait, block])
        self.runAction(sequence, withKey: "waiting")
        
    }
    
    func addToScene(scene: SKScene) {
        // add car and iCar
        scene.addChild(self)
        iCar.parentCar = self
        iCar.name = "iCar"
        scene.addChild(iCar)
    }

    
    func speedUp() {
        // make car speed and iCar 4 times faster
        if type == Type.road{
            if self.actionForKey("moving") != nil{
                let movingAction = self.actionForKey("moving")
                movingAction?.speed = carSpeed * 4
            }
            if iCar.actionForKey("moving2") != nil{
                let movingAction = iCar.actionForKey("moving2")
                movingAction?.speed = carSpeed * 4
            }
            speedUpBool = true
            stopBool = false

        }
        
    }
    
    func setTheSpeed(speed: CGFloat) {
        runAction(SKAction.speedTo(speed, duration: 0.0))
        iCar.runAction(SKAction.speedTo(speed, duration: 0.0))
        carSpeed = speed
    }
    
    func stop() {
        if let movingAction = self.actionForKey("moving"), movingAction2 = iCar.actionForKey("moving2") {
            //Pause the action (movement)
            movingAction.speed = 0.0
            movingAction2.speed = 0.0
            self.stopBool = true
            self.speedUpBool = false
            let wait = SKAction.waitForDuration(30)
            let block = SKAction.runBlock({
                //Unpause the action
                movingAction.speed = self.speed
                movingAction2.speed = self.speed
                self.stopBool = false
            })
            let sequence = SKAction.sequence([wait, block ])
            self.runAction(sequence, withKey: "waiting")
        }
    }
    
}