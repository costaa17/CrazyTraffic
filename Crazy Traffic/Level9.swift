import SpriteKit

class Level9: Levels{
    
    override func didMoveToView(view: SKView) {
        level = "lv9";
        levelGoal = 40
        levelNum = 9
        
        data = "road:31.0,42.0@31.0,-4.0/road:-4.0,19.0@66.0,19.0/road:66.0,42.0@-4.0,-4.0/road:66.0,-4.0@-4.0,42.0"
        
        
        self.backgroundColor = UIColor(red: 0/255.0, green: 153/255.0, blue: 0/255.0, alpha: 1.0)
        
        movedToView((self.view)!)
        
    }
}
