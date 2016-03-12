import SpriteKit

class Level10: Levels{
    
    override func didMoveToView(view: SKView) {
        level = "lv10";
        levelGoal = 40
        levelNum = 10
        
        data = "/walk:48.0,42.0@48.0,-4.0/walk:14.0,42.0@14.0,-4.0/walk:14.0,-4.0@14.0,42.0/walk:-4.0,15.0@66.0,15.0@31.0,28.0/walk:-4.0,22.0@66.0,23.0@31.0,11.0/road:-4.0,42.0@66.0,42.0@31.0,-27.0/road:-4.0,-4.0@66.0,-4.0@31.0,65.0#66.0,-4.0/cross:48.0,24.0@48.0,13.0/cross:14.0,24.0@14.0,13.0/cross:7.0,19.0@18.0,19.0/cross:43.0,19.0@55.0,19.0"        
        
        self.backgroundColor = UIColor(red: 0/255.0, green: 153/255.0, blue: 0/255.0, alpha: 1.0)
        
        movedToView((self.view)!)
        
    }
}
