import SpriteKit

class Level7: Levels{
    
    override func didMoveToView(view: SKView) {
        level = "lv7";
        levelGoal = 40
        levelNum = 7
        
        data = "walk:-5.0,20.0@67.0,20.0/walk:67.0,18.0@-5.0,18.0/road:31.0,-6.0@31.0,44.0/road:11.0,43.0@11.0,-6.0/road:51.0,43.0@51.0,-6.0/road:-4.0,31.0@68.0,31.0/road:66.0,7.0@-6.0,7.0/cross:15.0,18.0@7.0,18.0/cross:15.0,20.0@7.0,20.0/cross:27.0,20.0@35.0,20.0/cross:27.0,18.0@35.0,18.0/cross:47.0,20.0@55.0,20.0/cross:47.0,18.0@55.0,18.0"
        
        self.backgroundColor = UIColor(red: 0/255.0, green: 153/255.0, blue: 0/255.0, alpha: 1.0)
        
        movedToView((self.view)!)
        
    }
}
