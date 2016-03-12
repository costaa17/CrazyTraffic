//
//  MapScene.swift
//  Crazy Traffic
//
//  Created by Ana Vitoria do Valle Costa on 2/6/16.
//  Copyright © 2016 Ana Vitoria do Valle Costa. All rights reserved.
//

import Foundation
import SpriteKit

public class MapScene: SKScene{
    
    var touchStartPoint: CGPoint?
    var max = false
    var max1 = false
    var max2 = false
    
    override public func didMoveToView(view: SKView) {
        self.view!.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: Selector("handleLongPress:")))
        
        
        
        self.backgroundColor = UIColor.blackColor()
        let circle = SKShapeNode()
        let path = CGPathCreateMutable()
        CGPathAddArc(path, nil , 50, 50, 20, 0, CGFloat(2.0 * (M_PI)), true)
        circle.path = path
        circle.lineWidth = 5
        circle.fillColor = UIColor.blueColor()
        circle.name = "lv1"
        self.addChild(circle)
        
        let label = SKLabelNode(fontNamed:"Chalkduster")
        label.text = "1"
        label.fontSize = 20
        label.position = CGPointMake(50, 40)
        self.addChild(label)
        
        let circle2 = SKShapeNode()
        let path2 = CGPathCreateMutable()
        CGPathAddArc(path2, nil , 140, 90, 20, 0, CGFloat(2.0 * (M_PI)), true)
        
        circle2.path = path2
        circle2.lineWidth = 5
        circle2.fillColor = UIColor.orangeColor()
        circle2.name = "lv2"
        self.addChild(circle2)
        
        let label2 = SKLabelNode(fontNamed:"Chalkduster")
        label2.text = "2"
        label2.fontSize = 20
        label2.position = CGPointMake(140, 80)
        self.addChild(label2)
        
        let circle3 = SKShapeNode()
        let path3 = CGPathCreateMutable()
        CGPathAddArc(path3, nil , 230, 110, 20, 0, CGFloat(2.0 * (M_PI)), true)
        
        circle3.path = path3
        circle3.lineWidth = 5
        circle3.fillColor = UIColor.greenColor()
        circle3.name = "lv3"
        self.addChild(circle3)
        
        let label3 = SKLabelNode(fontNamed:"Chalkduster")
        label3.text = "3"
        label3.fontSize = 20
        label3.position = CGPointMake(230, 100)
        self.addChild(label3)
        
        let circle4 = SKShapeNode()
        let path4 = CGPathCreateMutable()
        CGPathAddArc(path4, nil , 320, 90, 20, 0, CGFloat(2.0 * (M_PI)), true)
        
        circle4.path = path4
        circle4.lineWidth = 5
        circle4.fillColor = UIColor.purpleColor()
        circle4.name = "lv4"
        self.addChild(circle4)
        
        let label4 = SKLabelNode(fontNamed:"Chalkduster")
        label4.text = "4"
        label4.fontSize = 20
        label4.position = CGPointMake(320, 80)
        self.addChild(label4)
        
        let circle5 = SKShapeNode()
        let path5 = CGPathCreateMutable()
        CGPathAddArc(path5, nil , 410, 50, 20, 0, CGFloat(2.0 * (M_PI)), true)
        
        circle5.path = path5
        circle5.lineWidth = 5
        circle5.fillColor = UIColor.redColor()
        circle5.name = "lv5"
        self.addChild(circle5)
        
        let label5 = SKLabelNode(fontNamed:"Chalkduster")
        label5.text = "5"
        label5.fontSize = 20
        label5.position = CGPointMake(410, 40)
        self.addChild(label5)
        
        let circle6 = SKShapeNode()
        let path6 = CGPathCreateMutable()
        CGPathAddArc(path6, nil , 500, 90, 20, 0, CGFloat(2.0 * (M_PI)), true)
        
        circle6.path = path6
        circle6.lineWidth = 5
        circle6.fillColor = UIColor.blueColor()
        circle6.name = "lv6"
        self.addChild(circle6)
        
        let label6 = SKLabelNode(fontNamed:"Chalkduster")
        label6.text = "6"
        label6.fontSize = 20
        label6.position = CGPointMake(500, 80)
        self.addChild(label6)
        
        let circle7 = SKShapeNode()
        let path7 = CGPathCreateMutable()
        CGPathAddArc(path7, nil , 560, 160, 20, 0, CGFloat(2.0 * (M_PI)), true)
        
        circle7.path = path7
        circle7.lineWidth = 5
        circle7.fillColor = UIColor.orangeColor()
        circle7.name = "lv7"
        self.addChild(circle7)
        
        let label7 = SKLabelNode(fontNamed:"Chalkduster")
        label7.text = "7"
        label7.fontSize = 20
        label7.position = CGPointMake(560, 150)
        self.addChild(label7)
        
        let circle8 = SKShapeNode()
        let path8 = CGPathCreateMutable()
        CGPathAddArc(path8, nil , 570, 230, 20, 0, CGFloat(2.0 * (M_PI)), true)
        
        circle8.path = path8
        circle8.lineWidth = 5
        circle8.fillColor = UIColor.greenColor()
        circle8.name = "lv8"
        self.addChild(circle8)
        
        let label8 = SKLabelNode(fontNamed:"Chalkduster")
        label8.text = "8"
        label8.fontSize = 20
        label8.position = CGPointMake(570, 220)
        self.addChild(label8)
        
        let circle9 = SKShapeNode()
        let path9 = CGPathCreateMutable()
        CGPathAddArc(path9, nil , 560, 300, 20, 0, CGFloat(2.0 * (M_PI)), true)
        
        circle9.path = path9
        circle9.lineWidth = 5
        circle9.fillColor = UIColor.purpleColor()
        circle9.name = "lv9"
        self.addChild(circle9)
        
        let label9 = SKLabelNode(fontNamed:"Chalkduster")
        label9.text = "9"
        label9.fontSize = 20
        label9.position = CGPointMake(560, 290)
        self.addChild(label9)
        
        let circle10 = SKShapeNode()
        let path10 = CGPathCreateMutable()
        CGPathAddArc(path10, nil , 500, 350, 20, 0, CGFloat(2.0 * (M_PI)), true)

        circle10.path = path10
        circle10.lineWidth = 5
        circle10.fillColor = UIColor.redColor()
        circle10.name = "lv10"
        self.addChild(circle10)
        
        let label10 = SKLabelNode(fontNamed:"Chalkduster")
        label10.text = "10"
        label10.fontSize = 20
        label10.position = CGPointMake(500, 340)
        self.addChild(label10)
        
        
        let circle11 = SKShapeNode()
        let path11 = CGPathCreateMutable()
        CGPathAddArc(path11, nil , 420, 330, 20, 0, CGFloat(2.0 * (M_PI)), true)

        circle11.path = path11
        circle11.lineWidth = 5
        circle11.fillColor = UIColor.blueColor()
        circle11.name = "lv11"
        self.addChild(circle11)
    
        let label11 = SKLabelNode(fontNamed:"Chalkduster")
        label11.text = "11"
        label11.fontSize = 20
        label11.position = CGPointMake(420, 320)
        self.addChild(label11)
        
        let circle12 = SKShapeNode()
        let path12 = CGPathCreateMutable()
        CGPathAddArc(path12, nil , 340, 350, 20, 0, CGFloat(2.0 * (M_PI)), true)
        
        circle12.path = path12
        circle12.lineWidth = 5
        circle12.fillColor = UIColor.orangeColor()
        circle12.name = "lv12"
        self.addChild(circle12)
        
        let label12 = SKLabelNode(fontNamed:"Chalkduster")
        label12.text = "12"
        label12.fontSize = 20
        label12.position = CGPointMake(340, 340)
        self.addChild(label12)
        
        let circle13 = SKShapeNode()
        let path13 = CGPathCreateMutable()
        CGPathAddArc(path13, nil , 260, 400, 20, 0, CGFloat(2.0 * (M_PI)), true)
        
        circle13.path = path13
        circle13.lineWidth = 5
        circle13.fillColor = UIColor.greenColor()
        circle13.name = "lv13"
        self.addChild(circle13)
       
        let label13 = SKLabelNode(fontNamed:"Chalkduster")
        label13.text = "13"
        label13.fontSize = 20
        label13.position = CGPointMake(260, 390)
        self.addChild(label13)

        
       
        
        
        
        
    }
    override public func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)
        self.touchStartPoint = touchLocation
        let nodes = self.nodesAtPoint(touchLocation)
        for node in nodes {
            if node.name != nil{
                 // test what level was touched
                switch node.name! {
                case "lv1":
                    let scene = Level1()
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = (size: skView.bounds.size)
                    skView.presentScene(scene)
                    
                case "lv2":
                    let scene = Level2()
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = (size: skView.bounds.size)
                    skView.presentScene(scene)
                    
                case "lv3":
                    let scene = Level3()
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = (size: skView.bounds.size)
                    skView.presentScene(scene)
                    
                case "lv4":
                    let scene = Level4()
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = (size: skView.bounds.size)
                    skView.presentScene(scene)
                    
                case "lv5":
                    let scene = Level5()
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = (size: skView.bounds.size)
                    skView.presentScene(scene)
                    
                case "lv6":
                    let scene = Level6()
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = (size: skView.bounds.size)
                    skView.presentScene(scene)
                    
                case "lv7":
                    let scene = Level7()
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = (size: skView.bounds.size)
                    skView.presentScene(scene)
                    
                case "lv8":
                    let scene = Level8()
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = (size: skView.bounds.size)
                    skView.presentScene(scene)
                    
                case "lv9":
                    let scene = Level9()
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = (size: skView.bounds.size)
                    skView.presentScene(scene)
                    
                case "lv10":
                    let scene = Level10()
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = (size: skView.bounds.size)
                    skView.presentScene(scene)
                    
                case "lv11":
                    let scene = Level11()
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = (size: skView.bounds.size)
                    skView.presentScene(scene)
                    
                case "lv12":
                    let scene = Level12()
                    let skView = self.view as SKView!
                    skView.ignoresSiblingOrder = true
                    scene.scaleMode = .ResizeFill
                    scene.size = (size: skView.bounds.size)
                    skView.presentScene(scene)
                    
                case "lv13":
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
            }
        }
    }
    
    func handleLongPress(gesture: UILongPressGestureRecognizer) {
        let point = gesture.locationInView(self.view)
        let deltay = point.y - touchStartPoint!.y
            self.enumerateChildNodesWithName("*") {
            node, stop in
            if node.name != nil && self.view?.bounds.height != nil{
                if node.name! == "lv9"{
                    if  node.position.y + (deltay/9) <= -150{
                        self.max = true
                        self.max2 = true
                    }else{
                        self.max2 = false
                    }
                }
                if node.name! == "lv1"{
                    if  node.position.y + (deltay/9) >  50{
                        self.max = true
                        self.max1 = true
                        
                    }else{
                        self.max1 = false
                    }
                }
            }
        }
        if !max1 && !max2{
            self.max = false
        }
        self.enumerateChildNodesWithName("*") {
            node, stop in
            if !self.max{
                node.position = CGPointMake(node.position.x , node.position.y + (deltay/9))
            }
        }
    }
    
    /*func panForTranslation(translation: CGPoint) {
    self.enumerateChildNodesWithName("*") {
    node, stop in
    print(translation.y)
    node.position = CGPointMake(node.position.x , node.position.y - translation.y)
    
    }
    
    }*/
    
    /*func handlePanFrom(gesture: UIPanGestureRecognizer) {
    let deltay = gesture.translationInView(self.view).y
    self.enumerateChildNodesWithName("*") {
    node, stop in
    node.position = CGPointMake(node.position.x , node.position.y - deltay)
    
    }
    }*/
    
    /*override public func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
    let touch = touches.reverse().first
    let touchLocation = touch!.locationInNode(self)
    let deltay =  touchStartPoint!.y - touchLocation.y
    self.enumerateChildNodesWithName("lv3") {
    node, stop in
    node.position = CGPointMake(node.position.x , node.position.y + deltay)
    
    }
    }*/
}