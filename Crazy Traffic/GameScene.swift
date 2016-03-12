//
//  GameScene.swift
//  Crazy Traffic
//
//  Created by Ana Vitoria do Valle Costa on 1/8/16.
//  Copyright (c) 2016 Ana Vitoria do Valle Costa. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        let button = SKEffectNode()
        let playB = SKShapeNode()
        playB.name = "playButton"
        let clippath = CGPathCreateWithRoundedRect (CGRectMake(0,0,350,100), 10.0, 10.0, nil)
        self.backgroundColor = UIColor(red: 0/255.0, green: 153/255.0, blue: 0/255.0, alpha: 1.0)
        playB.path = clippath
        playB.strokeColor = UIColor.blackColor()
        playB.fillColor = UIColor.whiteColor()
        playB.lineWidth = 5
        playB.position = CGPointMake((self.view!.frame.size.width/2) - 175, self.view!.frame.size.height/2 - 50)
        button.addChild(playB)
        
        let playDraw = SKShapeNode()
        let play = CGPathCreateMutable()
        CGPathMoveToPoint ( play , nil, 0, 0 )
        CGPathAddLineToPoint( play, nil, 0, 70 )
        CGPathAddLineToPoint( play, nil, 50, 35 )
        CGPathAddLineToPoint( play, nil, 0, 0 )
        playDraw.path = play
        playDraw.strokeColor = UIColor.blackColor()
        playDraw.fillColor = UIColor.greenColor()
        playDraw.lineWidth = 3
        playDraw.position = CGPointMake((self.view!.frame.size.width/2) - 17 , self.view!.frame.size.height/2 - 35 )
        button.addChild(playDraw)
        button.shouldRasterize = true
        self.addChild(button)
        }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)
        let nodes = self.nodesAtPoint(touchLocation)
        for node in nodes {
            if node.name == "playButton" {
                // go to Lv1
                let scene = MapScene()
                let skView = self.view as SKView!
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .ResizeFill
                scene.size = (size: skView.bounds.size)
                skView.presentScene(scene)
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
