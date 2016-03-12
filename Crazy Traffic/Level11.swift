import SpriteKit

class Level11: Levels{
    
    override func didMoveToView(view: SKView) {
        level = "lv11";
        levelGoal = 40
        levelNum = 11
        
        tutorial = true
        tutorialText = "Some crazy pedestrian might try to cross the road at the wrong place." + "\n\n" + "Make sure they cross safely!"

        data = "walk:26.0,44.0@26.0,16.0#26.0,16.0@30.0,12.0@26.0,12.0#30.0,12.0@64.0,12.0#/walk:9.0,45.0@9.0,16.0#9.0,16.0@15.0,12.0@9.0,12.0#15.0,12.0@69.0,12.0#/walk:40.0,41.0@40.0,33.0#40.0,33.0@48.0,27.0@40.0,28.0@40.0,27.0#48.0,27.0@54.0,21.0@54.0,27.0@54.0,28.0#54.0,21.0@54.0,-2.0/walk:66.0,12.0@-4.0,12.0#/road:16.0,45.0@16.0,-6.0#/road:19.0,-6.0@19.0,44.0#/road:47.0,-4.0@47.0,42.0#/road:-4.0,22.0@66.0,22.0#/road:66.0,17.0@-4.0,17.0#/road:47.0,-4.0@47.0,42.0#/cross:14.0,27.0@22.0,27.0#/cross:14.0,12.0@22.0,12.0#/cross:9.0,24.0@9.0,14.0#/cross:26.0,24.0@26.0,14.0#/cross:45.0,12.0@50.0,12.0#/cross:45.0,27.0@50.0,27.0#/cross:54.0,24.0@54.0,14.0#/crazyPedestrian:-3.0,41.0@39.0,-4.0/crazyPedestrian:-3.0,-3.0@38.0,41.0"
        
        self.backgroundColor = UIColor(red: 0/255.0, green: 153/255.0, blue: 0/255.0, alpha: 1.0)
        
        movedToView((self.view)!)
        
    }
}
