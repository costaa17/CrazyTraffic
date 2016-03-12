import SpriteKit

class Level1: Levels{
    
     override func didMoveToView(view: SKView) {
        level = "lv1";
        levelGoal = 15
        levelNum = 1
        levels = Level1()
            
        tutorial = true
        tutorialText = "Touch cars to stop them." + "\n " + "Slide cars forward to make them faster."
        data = "road:-6.0,19.0@68.0,19.0#/road:31.0,41.0@31.0,-8.0#"
        
        self.backgroundColor = UIColor(red: 0/255.0, green: 153/255.0, blue: 0/255.0, alpha: 1.0)

        movedToView((self.view)!)
        
    }
}
