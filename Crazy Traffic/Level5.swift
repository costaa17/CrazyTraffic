import SpriteKit

class Level5: Levels{
    
    override func didMoveToView(view: SKView) {
        level = "lv5";
        levelGoal = 55
        levelNum = 5
        
        data = "road:-4.0,32.0@66.0,32.0/road:66.0,27.0@-4.0,27.0/road:7.0,42.0@7.0,-4.0/road:12.0,-4.0@12.0,42.0/road:49.0,-4.0@49.0,42.0/road:-4.0,7.0@66.0,7.0"
        
        self.backgroundColor = UIColor(red: 0/255.0, green: 153/255.0, blue: 0/255.0, alpha: 1.0)
        
        movedToView((self.view)!)
        
    }
}
