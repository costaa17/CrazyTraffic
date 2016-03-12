import SpriteKit

class Level12: Levels{
    
    override func didMoveToView(view: SKView) {
        level = "lv12";
        levelGoal = 40
        levelNum = 12
        
        tutorial = true
        tutorialText = "Let's try to keep the city clean!" + "\n\n" + "If you find garbage, touch it to clean and get 1 point"
        
        data = "road:-6.0,-20.0@22.0,19.0@12.0,56.0#27.0,6.0@40.0,18.0@31.0,-7.0#36.0,6.0@71.0,-20.0@50.0,56.0#/road:68.0,54.0@40.0,20.0@51.0,-21.0#35.0,31.0@22.0,18.0@30.0,44.0#26.0,31.0@-4.0,49.0@13.0,-20.0#/road:22.0,44.0@45.0,-20.0/garbage:38.0,33.0/garbage:24.0,3.0"
        
        self.backgroundColor = UIColor(red: 0/255.0, green: 153/255.0, blue: 0/255.0, alpha: 1.0)
        
        movedToView((self.view)!)
        
    }
}
