import SpriteKit

class Level3: Levels{
    
    override func didMoveToView(view: SKView) {
        level = "lv3";
        levelGoal = 45
        levelNum = 3
        
        data = "road:-4.0,26.0@66.0,26.0/road:66.0,12.0@-4.0,12.0/road:51.0,-7.0@6.0,-7.0@33.0,86.0"
        
        self.backgroundColor = UIColor(red: 0/255.0, green: 153/255.0, blue: 0/255.0, alpha: 1.0)
        
        movedToView((self.view)!)
        
    }
}
