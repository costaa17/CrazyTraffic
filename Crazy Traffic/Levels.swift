//
//  Levels.swift
//  Crazy Traffic
//
//  Created by Ana Vitoria do Valle Costa on 1/8/16.
//  Copyright © 2016 Ana Vitoria do Valle Costa. All rights reserved.
//
import SpriteKit
import Foundation
enum SpecialGoal {
    case pedestrians
}
class Levels: SKScene, SKPhysicsContactDelegate{
    
    let defaults = NSUserDefaults.standardUserDefaults()
    let clippath = CGPathCreateWithRoundedRect (CGRectMake(0,0,175,50), 10.0, 10.0, nil)
    let carCategory: UInt32 = 0x1 << 0
    let personCategory: UInt32 = 0x1 << 1
    let invisibleCarCategory: UInt32 = 0x1 << 2
    
    let scoreLabel = SKLabelNode(fontNamed:"Chalkduster")
    let highScoreLabel = SKLabelNode(fontNamed:"Chalkduster")
    let goalLabel = SKLabelNode(fontNamed:"Chalkduster")
    let specialGoalLabel = SKLabelNode(fontNamed:"Chalkduster")
    
    
    let button = SKEffectNode()
    let playB = SKShapeNode()
    let tutorialShapeN = SKShapeNode()
    
    
    var tileWidth: CGFloat?
    var tileHeight: CGFloat?
    
    var data: String?
    var paths: [Path] = []
    var garbage: [CGPoint] = []
    var shouldAddGarbage: [Bool] = []
    
    var carSpeed: CGFloat = 5
    var maxInterval: UInt32 = 450
    var minInterval: UInt32 = 100
    
    var levels: SKScene?
    var level = ""
    var levelNum = 0
    var levelGoal = 0
    var tutorial = false
    var tutorialText = ""
    var specialGoal = false
    var specialGoalCountLabel = ""
    var specialGoalCount = 0
    var specialGoalType = SpecialGoal.pedestrians
    var requiredSpecialGoal = 0
    
    var playButton = SKSpriteNode()
    var tutorialLabel = UILabel(frame: CGRectMake(0, 0, 400, 40))
    var specialGoalExplanationLabel = UILabel(frame: CGRectMake(0, 0, 400, 40))
    
    
    var touchedCar: Cars?
    var score = 0
    var passed = false
    
    func movedToView(view: SKView) {
        
        let screenSize = UIScreen.mainScreen().bounds
        tileWidth = screenSize.width/64 // screen width / level editor COL_COUNT
        tileHeight = screenSize.height/40 // screen height / level editor ROW_COUNT
        
        self.view!.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: Selector("handlePanFrom:")))
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVectorMake(0, 0)
        
        // Draw the black background for tutorial
        let myPath = CGPathCreateMutable()
        CGPathMoveToPoint(myPath, nil, 0, 0)
        CGPathAddLineToPoint(myPath, nil, 0, CGRectGetMaxY(self.frame))
        CGPathAddLineToPoint(myPath, nil, CGRectGetMaxX(self.frame), CGRectGetMaxY(self.frame))
        CGPathAddLineToPoint(myPath, nil, CGRectGetMaxX(self.frame), 0)
        CGPathCloseSubpath(myPath)
        tutorialShapeN.path = myPath
        tutorialShapeN.fillColor = UIColor.blackColor()
        tutorialShapeN.strokeColor = UIColor.blackColor()
        tutorialShapeN.hidden = true
        
        //draw play button
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
        playButton = SKSpriteNode(texture: texture3)
        sprite.removeFromParent()
        sprite2.removeFromParent()
        playButton.name = "playButton"
        playButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 100)
        playButton.hidden = true
        
        //Show score
        scoreLabel.text = "Score: " + String(score)
        scoreLabel.fontSize = 20
        scoreLabel.position = CGPoint(x:CGRectGetMaxX(self.frame) - 100, y:CGRectGetMaxY(self.frame) - 50)
        self.addChild(scoreLabel)
        
        if specialGoal{
            specialGoalLabel.text = specialGoalCountLabel + String(specialGoalCount)
            specialGoalLabel.fontSize = 20
            specialGoalLabel.position = CGPoint(x:CGRectGetMaxX(self.frame) - 100, y:CGRectGetMaxY(self.frame) - 80)
            self.addChild(specialGoalLabel)
            specialGoalLabel.hidden = true
        }
        
        //Draw paths
        readData()
        for path in paths{
            for shapeN in path.shapeNode(){
                addChild(shapeN)
            }
        }
        
        //Add garbages in levels that have it
        for _ in garbage{
            shouldAddGarbage.append(true)
        }
        
        self.addChild(tutorialShapeN)
        self.addChild(playButton)
        
        paused = true
        if tutorial {
            showTutorial()
        }else{
            showLevel()
        }
    }
    
    func showTutorial(){
        scoreLabel.hidden = true
        tutorialShapeN.hidden = false
        playButton.hidden = false
        
        tutorialLabel.textColor = UIColor.whiteColor()
        tutorialLabel.text = tutorialText
        tutorialLabel.numberOfLines = 0
        tutorialLabel.font = UIFont(name: "Chalkduster", size: 20 )
        tutorialLabel.sizeToFit()
        tutorialLabel.textAlignment = NSTextAlignment.Center
        tutorialLabel.center = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) - 50)
        self.view!.addSubview(tutorialLabel)
    }
    
    // present goals for the level
    func showLevel(){
        scoreLabel.hidden = true
        tutorialShapeN.hidden = false
        playButton.hidden = false
        
        if !specialGoal{
            goalLabel.text = "To pass this level, you need: " + String(levelGoal) + " points"
            goalLabel.fontSize = 20
            goalLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) + 75)
            self.addChild(goalLabel)
            
        }else{
            specialGoalExplanationLabel.textColor = UIColor.whiteColor()
            specialGoalExplanationLabel.text! += "\n" + String(levelGoal) + " points"
            specialGoalExplanationLabel.numberOfLines = 0
            specialGoalExplanationLabel.font = UIFont(name: "Chalkduster", size: 20 )
            specialGoalExplanationLabel.sizeToFit()
            specialGoalExplanationLabel.textAlignment = NSTextAlignment.Center
            specialGoalExplanationLabel.center = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) - 50)
            self.view!.addSubview(specialGoalExplanationLabel)
        }
        
        let highScore = NSUserDefaults.standardUserDefaults().integerForKey(level)
        highScoreLabel.text = "High Score: "
        highScoreLabel.text! += String(highScore);
        highScoreLabel.fontSize = 20
        highScoreLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        if specialGoal{
            highScoreLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame) - 50)
        }
        
        self.addChild(highScoreLabel)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.touchedCar = nil
        let touch = touches.first
        let touchLocation = touch!.locationInNode(self)
        let nodes = self.nodesAtPoint(touchLocation)
        
        for node in nodes {
            if tutorial{
                if node.name == "playButton" { // go to show level
                    tutorialLabel.removeFromSuperview()
                    scoreLabel.hidden = false
                    tutorial = false
                    showLevel()
                }
                
            }else{ // in the game or in show level
                // test which car was touched
                if node.name == "car" ||  node.name == "person"{
                    touchedCar = node as? Cars
                }
                
                if node.name == "playButton" { // go to level
                    tutorialShapeN.removeFromParent()
                    scoreLabel.hidden = false
                    specialGoalLabel.hidden = false
                    playButton.removeFromParent()
                    goalLabel.removeFromParent()
                    highScoreLabel.removeFromParent()
                    specialGoalExplanationLabel.removeFromSuperview()
                    
                    paused = false
                }
                if node.name == "garbage" {
                    score++
                    scoreLabel.text = "Score: " + String(self.score)
                    for var i = 0; i < garbage.count; i = i + 1{
                        if node.position == garbage[i]{
                            shouldAddGarbage[i] = true
                            node.removeFromParent()
                            
                        }
                    }
                }
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if (touchedCar != nil){
            touchedCar!.stop()
        }
    }
    
    
    override func update(currentTime: CFTimeInterval) {
        addGarbage()
        // Loop over all nodes in the scene
        self.enumerateChildNodesWithName("*") {
            
            node, stop in
            if (node is SKSpriteNode && node.name == "car") {
                let sprite = node as! Cars
                sprite.setTheSpeed(self.carSpeed)
                
                if sprite.gotInScreen == true{
                    
                    // Check if the node is not in the scene
                    if (sprite.position.x < -sprite.size.width/2.0 || sprite.position.x > self.size.width + sprite.size.width/2.0
                        || sprite.position.y < -sprite.size.height/2.0 || sprite.position.y > self.size.height+sprite.size.height/2.0) {
                            
                            sprite.removeFromParent()
                            self.score++
                            self.scoreLabel.text = "Score: " + String(self.score)
                            
                            if self.score > 20 && self.score < 150{
                                self.carSpeed = CGFloat(self.score)/4
                                
                            }
                            
                            if self.score < 100{
                                
                                if(self.minInterval > 21){
                                    self.minInterval = self.minInterval - 3
                                }
                                
                                if(self.maxInterval < 41){
                                    self.maxInterval = self.minInterval - 3
                                }
                            }
                            if self.specialGoal{
                                
                                if self.specialGoalType == SpecialGoal.pedestrians && node.name == Optional("person"){
                                    self.specialGoalCount++
                                    self.specialGoalLabel.text = self.specialGoalCountLabel + String(self.specialGoalCount)
                                }
                            }
                    }
                    
                    // Check if the node got in the scene
                }else if (sprite.position.x > 0 && sprite.position.x < self.size.width && sprite.position.y > 0 && sprite.position.y < self.size.height){
                    
                    sprite.gotInScreen = true
                    
                    
                    sprite.iCar.physicsBody = SKPhysicsBody(rectangleOfSize: sprite.iCar.size)
                    sprite.iCar.physicsBody!.categoryBitMask = self.invisibleCarCategory
                    sprite.iCar.physicsBody!.contactTestBitMask = self.carCategory
                    sprite.iCar.physicsBody!.collisionBitMask = 0
                    sprite.iCar.physicsBody!.usesPreciseCollisionDetection = true
                    sprite.iCar.physicsBody!.dynamic = false
                    
                    
                    
                }
            }
        }
        
        for path in paths{
            
            if path.shouldRunCar(){
                
                // create a new random time to the next car
                path.timeGapForNextRun = random(minInterval, max: maxInterval)
                path.currentInterval = 0
                
                if path.type == Type.road{
                    //add cars
                    let car = Cars(texture: SKTexture(imageNamed: "car"))
                    car.name = "car"
                    car.type = Type.road
                    car.carSpeed = carSpeed
                    car.startAction(path)
                    
                    //car.physicsBody = SKPhysicsBody(rectangleOfSize: car.size)
                    car.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(40.0, 57.0)) // size of the car draw itself, not the size of the image
                    car.physicsBody!.categoryBitMask = carCategory
                    car.physicsBody!.contactTestBitMask = carCategory
                    car.physicsBody!.collisionBitMask = 0
                    car.physicsBody!.usesPreciseCollisionDetection = true
                    car.physicsBody!.dynamic = true
                    
                    if self.scene == nil{
                        print("scene = nil")
                    }else{
                        car.addToScene(self.scene!)
                    }
                    
                    // add people
                }else if path.type == Type.walk || path.type == Type.crazyPedestrian{
                    let car = Cars(texture: SKTexture(imageNamed: "person"))
                    car.name = "person"
                    car.xScale = 0.4
                    car.yScale = 0.4
                    car.type = Type.walk
                    car.carSpeed = carSpeed * 0.7
                    car.startAction(path)
                    car.physicsBody = SKPhysicsBody(rectangleOfSize: car.size)
                    
                    car.physicsBody!.categoryBitMask = personCategory
                    car.physicsBody!.contactTestBitMask = carCategory
                    car.physicsBody!.collisionBitMask = 0
                    car.physicsBody!.usesPreciseCollisionDetection = false
                    car.physicsBody!.dynamic = true
                    //addChild(car)
                    if self.scene == nil{
                        print("scene = nil")
                    }else{
                        car.addToScene(self.scene!)
                    }
                }
                
            }else{
                path.currentInterval++
            }
        }
    }
    
    
    func didBeginContact(contact: SKPhysicsContact) {
        //print(contact.bodyA.categoryBitMask)
        //print(contact.bodyB.categoryBitMask)
        
        // if not 2 people and not 2 icars (game over)
        if (contact.bodyA.categoryBitMask != personCategory || contact.bodyB.categoryBitMask != personCategory) && (contact.bodyA.categoryBitMask != invisibleCarCategory && contact.bodyB.categoryBitMask != invisibleCarCategory){
            
            // Update high score if necessary
            if defaults.integerForKey(level) < score{
                defaults.setInteger(score, forKey: level)
                defaults.synchronize()
            }
            
            // test if passed the level
            if score >= levelGoal{
                passed = true
            }
            if specialGoal{
                
                if requiredSpecialGoal > specialGoalCount{
                    passed = false
                }
                
            }
            // update current level if necessary
            if defaults.integerForKey("current lv") == levelNum && passed{
                defaults.setInteger(levelNum + 1, forKey: "current lv")
            }
            
            
            let scene = GameOver()
            
            if specialGoal{
                scene.specialGoal = true
                scene.specialGoalCount = self.requiredSpecialGoal
                
                if specialGoalType == SpecialGoal.pedestrians{
                    scene.specialGoalLabel = "pedestrians"
                }
            }
            
            scene.levelNumber = self.levelNum
            scene.score = score
            scene.level = level
            scene.passed = passed
            scene.levelGoal = levelGoal
            let skView = self.view as SKView!
            skView.ignoresSiblingOrder = true
            scene.scaleMode = .ResizeFill
            scene.size = (size: skView.bounds.size)
            skView.presentScene(scene)
            
            // if collision between iCar and car
        }else if (contact.bodyA.categoryBitMask == invisibleCarCategory && contact.bodyB.categoryBitMask == carCategory) || (contact.bodyB.categoryBitMask == invisibleCarCategory && contact.bodyA.categoryBitMask == carCategory) {
            var car: Cars?
            var iCar: InvisibleCar?
            if contact.bodyA.categoryBitMask == carCategory{
                car = contact.bodyA.node as? Cars
                iCar = contact.bodyB.node as? InvisibleCar
            }else{
                car = contact.bodyB.node as! Cars
                iCar = contact.bodyA.node as! InvisibleCar
            }
            //not colliding with the parent car and in same path
            if iCar?.parentCar != car && String((iCar?.parentCar!.path!.path)!) == String(car!.path!.path){
                // back car speed up and front car stoped
                if car!.speedUpBool && iCar!.parentCar!.stopBool{
                    
                    // set both cars speed to normal speed
                    if iCar!.parentCar!.actionForKey("moving") != nil{
                        let movingAction = self.actionForKey("moving")
                        movingAction?.speed = carSpeed
                        print("speed")
                    }
                    if iCar!.actionForKey("moving2") != nil{
                        let movingAction = iCar!.actionForKey("moving2")
                        movingAction?.speed = carSpeed
                    }
                    
                    if car!.actionForKey("moving") != nil{
                        let movingAction = self.actionForKey("moving")
                        movingAction?.speed = carSpeed
                        print("speed")
                    }
                    if car!.iCar.actionForKey("moving2") != nil{
                        let movingAction = car!.iCar.actionForKey("moving2")
                        movingAction?.speed = carSpeed
                    }
                    
                    // if front car stoped
                }else if iCar!.parentCar!.stopBool{
                    // stop back car
                    car!.stop()
                    
                    // if back car speed up
                }else{
                    // speed up front car
                    iCar!.parentCar?.speedUp()
                }
            }
        }
    }
    
    
    private func radToDeg(radians: CGFloat) -> CGFloat {
        return radians * CGFloat((180.0 / M_PI))
    }
    
    
    private func degToRad(degrees: CGFloat) -> CGFloat {
        return degrees / CGFloat(180.0) * CGFloat(M_PI)
    }
    
    
    func positiveAngle( a: CGFloat) -> CGFloat{
        var angle = a
        
        if a < 0{
            angle = 360 + a
            
        }else if a == 0{
            angle = 360
        }
        
        return angle
    }
    
    
    func handlePanFrom(gesture: UIPanGestureRecognizer) {
        if touchedCar != nil{
            switch gesture.state {
            case .Began:
                break
            case .Ended:
                let velocity = gesture.velocityInView(gesture.view?.superview)
                var panAngle = radToDeg(atan2(velocity.y, velocity.x))
                
                // rotate cc 90
                panAngle = 270.0 - panAngle
                
                // make right side negative to match spritekit
                if panAngle > 180 {
                    panAngle = panAngle - 360
                }
                
                let oppAngle = panAngle - 180
                let a = radToDeg(touchedCar!.zRotation)
                let delta = CGFloat(35.0)
                
                
                //test if slided forward
                if (positiveAngle(a) > positiveAngle(positiveAngle(panAngle) - delta) && positiveAngle(a) < positiveAngle(positiveAngle(panAngle) + delta)) || (positiveAngle(a) < 360 - (positiveAngle(positiveAngle(panAngle) - delta)) && positiveAngle(a) > (360 - positiveAngle(positiveAngle(panAngle) + delta))){
                    
                    touchedCar!.speedUp()
                    
                    //test if slided backward (not working)
                } else if (positiveAngle(a) > positiveAngle(oppAngle - delta) && positiveAngle(a) < positiveAngle(oppAngle + delta)) || (positiveAngle(a) > 360 - (positiveAngle(oppAngle - delta)) && positiveAngle(a) < (360 - positiveAngle(oppAngle + delta))){
                    
                    touchedCar!.stop()
                }
                
            default:
                break
            }
        }
    }
    
    
    func readData() -> [Path] {
        let indexes = data!.characters.split("/").map() {String($0)} // get each path
        for(var i = 0; i < indexes.count; i++){
            
            var pathArray: [[CGPoint]] = []
            var points: [CGPoint] = []
            let typeString = indexes[i].characters.split(":").map() {String($0)}
            let pathAString = typeString[1].characters.split("#").map() {String($0)}
            
            //let pointsString = pathAString[1].characters.split("@").map() {String($0)}
            for a in pathAString{
                let pointsString = a.characters.split("@").map() {String($0)}
                
                for var p = 0; p < pointsString.count; p = p + 1{
                    
                    let xyString = pointsString[p].characters.split(",").map() {String($0)}
                    let flx = CGFloat((xyString[0] as NSString).floatValue)
                    let fly = CGFloat((xyString[1] as NSString).floatValue)
                    points.append(CGPointMake(flx , fly ))
                }
                pathArray.append(points)
                points = []
            }
            
            // create the Path
            if typeString[0] == "road"{
                paths.append(Path(type: Type.road, tileWidth: tileWidth!, tileHeight: tileHeight!, pointsArray: pathArray))
            }
            
            if typeString[0] == "rail"{
                paths.append(Path(type: Type.rail, tileWidth: tileWidth!, tileHeight: tileHeight!, pointsArray: pathArray))
                
            }
            
            if typeString[0] == "walk"{
                paths.append(Path(type: Type.walk, tileWidth: tileWidth!, tileHeight: tileHeight!, pointsArray: pathArray))
                
            }
            
            if typeString[0] == "cross"{
                paths.append(Path(type: Type.cross, tileWidth: tileWidth!, tileHeight: tileHeight!, pointsArray: pathArray))
                
            }
            
            if typeString[0] == "crazyPedestrian"{
                paths.append(Path(type: Type.crazyPedestrian, tileWidth: tileWidth!, tileHeight: tileHeight!, pointsArray: pathArray))
                
            }
            if typeString[0] == "garbage"{
                garbage.append(centerPoint(pathArray[0][0]))
                
            }
            
            if paths.last != nil{
                paths.last!.timeGapForNextRun = random(minInterval, max: maxInterval)
            }
        }
        
        return paths
    }
    
    
    func random(min: UInt32, max: UInt32) -> UInt32 {
        
        let range = UInt32(min)...UInt32(max)
        return range.startIndex + arc4random_uniform(range.endIndex - range.startIndex + 1 )
        
    }
    // test CGPath intersection
    /*func pathIntersect() -> CGPoint{
    var path1 = paths[1]
    var path2 = paths[0]
    let minX = min(floor(CGPathGetBoundingBox(path1.buildCGPath()).origin.x), floor(CGPathGetBoundingBox(path2.buildCGPath()).origin.x))
    let minY = min(floor(CGPathGetBoundingBox(path1.buildCGPath()).origin.y), floor(CGPathGetBoundingBox(path2.buildCGPath()).origin.y))
    let maxX = min(floor(CGPathGetBoundingBox(path1.buildCGPath()).origin.x + CGPathGetBoundingBox(path1.buildCGPath()).size.width), floor(CGPathGetBoundingBox(path2.buildCGPath()).origin.x + CGPathGetBoundingBox(path2.buildCGPath()).size.width))
    let maxY = min(floor(CGPathGetBoundingBox(path1.buildCGPath()).origin.y + CGPathGetBoundingBox(path1.buildCGPath()).size.height), floor(CGPathGetBoundingBox(path2.buildCGPath()).origin.y + CGPathGetBoundingBox(path2.buildCGPath()).size.height))
    for var x = minX; x < maxX; x = x + 1{
    for var y = minY; y < maxY; y = y + 1{
    let point = CGPointMake(x, y)
    let pathToTest1 = CGPathCreateCopyByStrokingPath(paths[1].buildCGPath(), nil, 26, CGLineCap.Square, CGLineJoin.Round, 0)
    let pathToTest2 = CGPathCreateCopyByStrokingPath(paths[0].buildCGPath(), nil, 26, CGLineCap.Square, CGLineJoin.Round, 0)
    let contains1 = CGPathContainsPoint(pathToTest1, nil, point, false)
    let contains2 = CGPathContainsPoint(pathToTest2, nil, point, false)
    if contains1 && contains2{
    return point
    }
    }
    }
    return CGPointMake(0, 0)
    }*/
    
    func centerPoint(myPoint: CGPoint) -> CGPoint{
        let point = pointFromIndex(myPoint)
        return CGPointMake((floor(point.x / self.tileWidth!) * self.tileWidth!) + self.tileWidth!, (floor(point.y / self.tileHeight!) * self.tileHeight!) + self.tileHeight!)
    }
    
    func pointFromIndex(point: CGPoint) -> CGPoint{
        return CGPointMake(point.x * self.tileWidth!, point.y * self.tileHeight!)
    }
    
    func addGarbage(){
        // add garbage in random place in random time
        for var j = 0; j < garbage.count; j = j + 1{
            let g: SKSpriteNode
            let i = random(1, max: 6000)
            if shouldAddGarbage[j]{
                switch i {
                case 1:
                    g = SKSpriteNode(imageNamed: "paper")
                    g.xScale = 0.8
                    g.yScale = 0.8
                    g.position = garbage[j]
                    g.name = "garbage"
                    self.addChild(g)
                    self.shouldAddGarbage[j] = false
                    
                    
                case 2:
                    g = SKSpriteNode(imageNamed: "plasticBag")
                    g.xScale = 0.6
                    g.yScale = 0.6
                    g.position = garbage[j]
                    g.name = "garbage"
                    self.addChild(g)
                    self.shouldAddGarbage[j] = false
                    
                case 3:
                    g = SKSpriteNode(imageNamed: "can")
                    g.xScale = 0.1
                    g.yScale = 0.1
                    g.position = garbage[j]
                    g.name = "garbage"
                    self.addChild(g)
                    self.shouldAddGarbage[j] = false
                    
                default: break
                    
                }
            }
        }
    }
}