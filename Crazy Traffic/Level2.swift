import SpriteKit

class Level2: Levels{
    
    override func didMoveToView(view: SKView) {
        level = "lv2";
        levelGoal = 40
        levelNum = 2
        
        data = "road:-8.0,22.0@69.0,22.0#/road:70.0,17.0@-14.0,17.0#/road:28.0,44.0@28.0,-10.0#/road:33.0,-5.0@33.0,57.0#/"
        
        self.backgroundColor = UIColor(red: 0/255.0, green: 153/255.0, blue: 0/255.0, alpha: 1.0)
        
        movedToView((self.view)!)
        
    }
}
