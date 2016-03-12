import Foundation
import SpriteKit


public class Path {
    var path: [[CGPoint]]
    var type: Type
    var tileWidth: CGFloat
    var tileHeigth: CGFloat
    var currentInterval: UInt32 = 0
    var timeGapForNextRun: UInt32 = 0

    
    init(type: Type, tileWidth: CGFloat, tileHeight: CGFloat, pointsArray: [[CGPoint]]){
        path = pointsArray
        self.type = type;
        self.tileWidth = tileWidth
        self.tileHeigth = tileHeight
    }
    
    func buildCGPath() -> CGPathRef{
        let myPath = CGPathCreateMutable()
         for a in path{
        if a.count == 2 {
            // Draw a straight line
            //if path[0] == a {
            CGPathMoveToPoint ( myPath , nil, centerPoint(a[0]).x, centerPoint(a[0]).y )
            //}
            CGPathAddLineToPoint( myPath, nil, centerPoint(a[1]).x, centerPoint(a[1]).y )
            
        }else if a.count == 3 {
            // Draw curve with 3 points
            //if path[0] == a {
            CGPathMoveToPoint( myPath , nil, centerPoint(a[0]).x, centerPoint(a[0]).y )
            //}
            CGPathAddCurveToPoint( myPath, nil, centerPoint(a[2]).x, centerPoint(a[2]).y, centerPoint(a[1]).x, centerPoint(a[1]).y,centerPoint(a[1]).x, centerPoint(a[1]).y )
            
        }else if a.count == 4 {
            // Draw curve with 4 points
            //if path[0] == a {
            CGPathMoveToPoint( myPath , nil, centerPoint(a[0]).x, centerPoint(a[0]).y )
            //}
            CGPathAddCurveToPoint( myPath, nil, centerPoint(a[2]).x, centerPoint(a[2]).y, centerPoint(a[3]).x, centerPoint(a[3]).y,centerPoint(a[1]).x, centerPoint(a[1]).y )
        }
        }
        return myPath
    }
    
    func centerPoint(myPoint: CGPoint) -> CGPoint{
        let point = pointFromIndex(myPoint)
        return CGPointMake((floor(point.x / tileWidth) * tileWidth) + tileWidth, (floor(point.y / tileHeigth) * tileHeigth) + tileHeigth)
    }
    
    func pointFromIndex(point: CGPoint) -> CGPoint{
        return CGPointMake(point.x * tileWidth, point.y * tileHeigth)
    }
    
    func shapeNode() -> [SKShapeNode] {
        var myA: [SKShapeNode] = []
        
        if self.type == Type.road{
            let myShapeNode = SKShapeNode()
            myShapeNode.path = buildCGPath()
            myShapeNode.lineWidth = 53
            myShapeNode.strokeColor = UIColor(red: 96/255.0, green: 96/255.0, blue: 96/255.0, alpha: 1.0)//gray
            myA.append(myShapeNode)
            
            
        }else if self.type == Type.rail{
            //add wood part
            let myShapeNode = SKShapeNode()
            myShapeNode.path = buildCGPath()
            myShapeNode.lineWidth = 20
            let myDashedPath = CGPathCreateCopyByDashingPath(myShapeNode.path, nil, 0, [5.0,5.0], 2)
            myShapeNode.strokeColor = UIColor(red: 102/255.0, green: 51/255.0, blue: 0.0, alpha: 1.0)//brown
            myShapeNode.path = myDashedPath
            myA.append(myShapeNode)

            //add steel part
            let myShapeNode2 = SKShapeNode()
            myShapeNode2.path = buildCGPath()
            let myShapeNodeOutP = SKShapeNode()
            myShapeNodeOutP.strokeColor = UIColor(red: 180/255.0, green: 180/255.0, blue: 180/255, alpha: 1.0) // gray
            let outPath = CGPathCreateCopyByStrokingPath(myShapeNode2.path, nil, 10, CGLineCap.Round , CGLineJoin.Round, 0)
            myShapeNodeOutP.path = outPath
            myShapeNodeOutP.lineWidth = 2
            myA.append(myShapeNodeOutP)
            
        }else if self.type == Type.cross{
            let myShapeNode = SKShapeNode()
            myShapeNode.path = buildCGPath()
            myShapeNode.lineWidth = 30
            let myDashedPath = CGPathCreateCopyByDashingPath(myShapeNode.path, nil, 0, [7.0,7.0], 2)
            myShapeNode.strokeColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)//brown
            myShapeNode.path = myDashedPath
            myA.append(myShapeNode)

            
        }else if self.type == Type.walk{
            
            let myShapeNode = SKShapeNode()
            myShapeNode.path = buildCGPath()
            myShapeNode.lineWidth = 15
            myA.append(myShapeNode)
            myShapeNode.strokeColor = UIColor(red: 167/255.0, green: 125/255.0, blue: 73/255, alpha: 1.0)//brown
        }
        
        return myA
    }
    func shouldRunCar() -> Bool{
        return currentInterval >= timeGapForNextRun
    }
}
