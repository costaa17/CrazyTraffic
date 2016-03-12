import SpriteKit

class Level6: Levels{
    
    override func didMoveToView(view: SKView) {
        level = "lv6";
        levelGoal = 55
        levelNum = 6
        tutorial = true
        tutorialText = "Help pedestrians to cross the roads safely!" + "\n \n "  + "You can touch pedestrians to stop them if necessary." + "\n \n" + "Good luck!"
        specialGoal = true
        specialGoalCountLabel = "Pedestrians: "
        specialGoalExplanationLabel.text = "To pass this level you will need: \n To help 15 pedestrians to cross the road safely."
        requiredSpecialGoal = 15
        data = "walk:44.0,42.0@44.0,-4.0/road:-17.0,17.0@81.0,17.0/road:68.0,22.0@-9.0,22.0/road:29.0,44.0@29.0,-7.0/road:34.0,-5.0@34.0,50.0/cross:44.0,14.0@44.0,25.0"
        
        self.backgroundColor = UIColor(red: 0/255.0, green: 153/255.0, blue: 0/255.0, alpha: 1.0)
        
        movedToView((self.view)!)
        
    }
}
