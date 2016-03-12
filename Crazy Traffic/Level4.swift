import SpriteKit

class Level4: Levels{
    
    override func didMoveToView(view: SKView) {
        level = "lv4";
        levelGoal = 55
        levelNum = 4
        
        data = "road:-4.0,22.0@66.0,22.0/road:66.0,17.0@-4.0,17.0/road:14.0,42.0@14.0,-4.0/road:41.0,-4.0@41.0,43.0/road:46.0,42.0@46.0,-4.0"
        
        self.backgroundColor = UIColor(red: 0/255.0, green: 153/255.0, blue: 0/255.0, alpha: 1.0)
        
        movedToView((self.view)!)
        
    }
}
