//
//  GameOver.swift
//  Crazy Traffic
//
//  Created by Ana Vitoria do Valle Costa on 2/3/16.
//  Copyright © 2016 Ana Vitoria do Valle Costa. All rights reserved.
//

import Foundation
import SpriteKit

class GameOver: SKScene{
    
    let gameOverLabel = SKLabelNode(fontNamed:"Chalkduster")
    let requiredScoreLabel = SKLabelNode(fontNamed:"Chalkduster")
    let scoreLabel = SKLabelNode(fontNamed:"Chalkduster")
    let specialLabel = SKLabelNode(fontNamed:"Chalkduster")
    let requiredSpecialGoalLabel = SKLabelNode(fontNamed:"Chalkduster")

    let highScoreLabel = SKLabelNode(fontNamed:"Chalkduster")
    
    var levelNumber = 0
    var level = ""
    var score = 0
    var passed = false
    var levelGoal = 0
    var specialGoal = false
    var specialGoalLabel = ""
    var specialGoalCount = 0
   
    override func didMoveToView(view: SKView) {
        self.backgroundColor = UIColor.blackColor()
        let highScore = NSUserDefaults.standardUserDefaults().integerForKey(level)

        if !specialGoal{
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontSize = 50
        gameOverLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) + 100)
        self.addChild(gameOverLabel)
        
        requiredScoreLabel.text = "Required Score: "
        requiredScoreLabel.text! += String(levelGoal);
        requiredScoreLabel.fontSize = 20
        requiredScoreLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        self.addChild(requiredScoreLabel)

        scoreLabel.text = "Score: "
        scoreLabel.text! += String(score);
        scoreLabel.fontSize = 20
        scoreLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) + 50)
        self.addChild(scoreLabel)
        
        highScoreLabel.text = "High Score: "
        highScoreLabel.text! += String(highScore);
        highScoreLabel.fontSize = 20
        highScoreLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) - 50)
        self.addChild(highScoreLabel)
        }
        
        //Draw the play button
        let button = SKEffectNode()
        let playB = SKShapeNode()
        let clippath = CGPathCreateWithRoundedRect (CGRectMake(0,0,175,50), 10.0, 10.0, nil)
        playB.path = clippath
        playB.strokeColor = UIColor.blackColor()
        playB.fillColor = UIColor.whiteColor()
        playB.lineWidth = 5
        playB.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        let playDraw = SKShapeNode()
        let play = CGPathCreateMutable()
        CGPathMoveToPoint ( play , nil, 0, 0 )
        CGPathAddLineToPoint( play, nil, 0, 35 )
        CGPathAddLineToPoint( play, nil, 25, 17.5 )
        CGPathAddLineToPoint( play, nil, 0, 0 )
        playDraw.path = play
        playDraw.strokeColor = UIColor.blackColor()
        playDraw.fillColor = UIColor.greenColor()
        playDraw.lineWidth = 3
        playDraw.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        let texture = view.textureFromNode(playB)
        let sprite = SKSpriteNode(texture: texture)
        let texture2 = view.textureFromNode(playDraw)
        let sprite2 = SKSpriteNode(texture: texture2)
        button.addChild(sprite)
        button.addChild(sprite2)
        button.shouldRasterize = true
        let texture3 = view.textureFromNode(button)
        let sprite3 = SKSpriteNode(texture: texture3)
        sprite3.name = "playButton"
        self.addChild(sprite3)
        sprite3.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 100)
        
        //Draw arrow
        let arrow = SKEffectNode()
        let triangleP = CGPathCreateMutable()
        CGPathMoveToPoint ( triangleP , nil, 20, 20 )
        CGPathAddLineToPoint( triangleP, nil, 20, 50 )
        CGPathAddLineToPoint( triangleP, nil, 0, 35 )
        CGPathAddLineToPoint( triangleP, nil, 20, 20)
        let rectangleP = CGPathCreateMutable()
        CGPathMoveToPoint ( rectangleP , nil, 20, 35 )
        CGPathAddLineToPoint( rectangleP, nil, 40, 35 )
        let triangle = SKShapeNode()
        triangle.path = triangleP
        let rectangle = SKShapeNode()
        rectangle.path = rectangleP
        triangle.strokeColor = UIColor.whiteColor()
        triangle.fillColor = UIColor.whiteColor()
        rectangle.strokeColor = UIColor.whiteColor()
        rectangle.lineWidth = 7
        arrow.addChild(triangle)
        arrow.addChild(rectangle)
        let arrowTexture = view.textureFromNode(arrow)
        let arrowSprite = SKSpriteNode(texture: arrowTexture)
        self.addChild(arrowSprite)
        arrowSprite.name = "Map"
        arrowSprite.position = CGPointMake(CGRectGetMinX(self.frame) + (arrowSprite.size.width / 2) + 5, CGRectGetMaxY(self.frame) - (arrowSprite.size.height/2) - 5)
        
        let mapLabel = SKLabelNode(fontNamed:"Chalkduster")
        mapLabel.text = "Map"
        mapLabel.fontSize = 15
        mapLabel.position = CGPoint(x: arrowSprite.position.x + arrowSprite.size.width + 3 ,y:arrowSprite.position.y - arrowSprite.size.height/4)
        self.addChild(mapLabel)
        
        if specialGoal{
            requiredScoreLabel.text = "Required Score: "
            requiredScoreLabel.text! += String(levelGoal);
            requiredScoreLabel.fontSize = 20
            requiredScoreLabel.position = CGPoint(x:CGRectGetMinX(self.frame) + 150, y:CGRectGetMidY(self.frame))
            self.addChild(requiredScoreLabel)
            
            specialLabel.text = specialGoalLabel + ": " + String(specialGoalCount)
            specialLabel.fontSize = 20
            specialLabel.position = CGPoint(x:CGRectGetMaxX(self.frame) - 120, y:CGRectGetMidY(self.frame) + 50)
            self.addChild(specialLabel)
            
            requiredSpecialGoalLabel.text = "Required: " + String(specialGoalCount) + " " + specialGoalLabel
            requiredSpecialGoalLabel.fontSize = 20
            requiredSpecialGoalLabel.position = CGPoint(x:CGRectGetMaxX(self.frame) - 175, y:CGRectGetMidY(self.frame))
            self.addChild(requiredSpecialGoalLabel)
            
            scoreLabel.text = "Score: "
            scoreLabel.text! += String(score);
            scoreLabel.fontSize = 20
            scoreLabel.position = CGPoint(x:CGRectGetMinX(self.frame) + 100, y:CGRectGetMidY(self.frame) + 50)
            self.addChild(scoreLabel)

        }
        
        if self.passed{
            let passedTotal = SKEffectNode()
            let passedPath = CGPathCreateWithRoundedRect (CGRectMake(0,0,175,50), 10.0, 10.0, nil)
            let passedLabel = SKLabelNode(fontNamed:"Chalkduster")
            let passed = SKShapeNode()
            passed.path = passedPath
            passed.strokeColor = UIColor.greenColor()
            passed.lineWidth = 5
            passed.fillColor = UIColor.blackColor()
            //passed.zRotation = CGFloat((2.0 * (M_PI))/8.0)
            passed.position = CGPointMake(CGRectGetMidX(self.frame) + 125, CGRectGetMidY(self.frame) - 100)
            passedTotal.addChild(passed)
            passedLabel.fontSize = 30
            passedLabel.text = "PASSED"
            passedLabel.fontColor = UIColor.greenColor()
            let textureLS = view.textureFromNode(passedLabel)
            let passedLabelSpriteNode = SKSpriteNode(texture: textureLS)
            passedLabelSpriteNode.position = CGPointMake(CGRectGetMidX(self.frame) + 125 + (3 * passedLabelSpriteNode.size.width/4), CGRectGetMidY(self.frame) - 100 + (5 * passedLabelSpriteNode.size.height/6))
            passedTotal.addChild(passedLabelSpriteNode)
            let passedTexture = view.textureFromNode(passedTotal)
            let passedTotalSpriteNode = SKSpriteNode(texture: passedTexture)
            self.addChild(passedTotalSpriteNode)
            passedTotalSpriteNode.zRotation = CGFloat(-(2.0 * (M_PI))/8.0)
            passedTotalSpriteNode.position = CGPointMake(CGRectGetMaxX(self.frame) - 75, CGRectGetMaxY(self.frame) - 75)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)
        let nodes = self.nodesAtPoint(touchLocation)
        
        for node in nodes {
            
            if node.name == "playButton" {
                // if passed, go to next level instead of repeating the same level
                if passed{
                    levelNumber++
                }
                
                // test level to go
                switch levelNumber{
                case 1:
                    let scene = Level1()
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = (size: skView.bounds.size)
                    skView.presentScene(scene)
                    
                case 2:
                    let scene = Level2()
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = (size: skView.bounds.size)
                    skView.presentScene(scene)
                    
                case 3:
                    let scene = Level3()
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = (size: skView.bounds.size)
                    skView.presentScene(scene)
                    
                case 4:
                    let scene = Level4()
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = (size: skView.bounds.size)
                    skView.presentScene(scene)
                    
                case 5:
                    let scene = Level5()
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = (size: skView.bounds.size)
                    skView.presentScene(scene)
                    
                case 6:
                    let scene = Level6()
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = (size: skView.bounds.size)
                    skView.presentScene(scene)
                    
                case 7:
                    let scene = Level7()
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = (size: skView.bounds.size)
                    skView.presentScene(scene)
                    
                case 8:
                    let scene = Level8()
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = (size: skView.bounds.size)
                    skView.presentScene(scene)
                    
                case 9:
                    let scene = Level9()
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = (size: skView.bounds.size)
                    skView.presentScene(scene)
                    
                case 10:
                    let scene = Level10()
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = (size: skView.bounds.size)
                    skView.presentScene(scene)
                    
                case 11:
                    let scene = Level11()
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = (size: skView.bounds.size)
                    skView.presentScene(scene)
                    
                case 12:
                    let scene = Level12()
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = (size: skView.bounds.size)
                    skView.presentScene(scene)
                    
                case 13:
                    let scene = Level13()
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = (size: skView.bounds.size)
                    skView.presentScene(scene)


                default:
                    let scene = Level1()
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = (size: skView.bounds.size)
                    skView.presentScene(scene)
                }
                
            }else if node.name == "Map" {
                //go to map
                let scene = MapScene()
                let skView = self.view as SKView!
                skView.ignoresSiblingOrder = true
                scene.scaleMode = .ResizeFill
                scene.size = (size: skView.bounds.size)
                skView.presentScene(scene)
            }
        }
    }
}