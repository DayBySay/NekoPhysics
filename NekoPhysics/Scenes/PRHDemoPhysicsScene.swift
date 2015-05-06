//
//  PRHDemoPhysicsScene.swift
//  NekoPhysics
//
//  Created by 清 貴幸 on 2015/05/06.
//  Copyright (c) 2015年 MojaProject. All rights reserved.
//

import SpriteKit

class PRHDemoPhysicsScene: SKScene {
    private var movableObject: SKSpriteNode?
   
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let ground: SKSpriteNode = SKSpriteNode(color: SKColor.brownColor(), size: CGSizeMake(size.width * 10, size.height))
        ground.position = CGPointMake(0, -200);
        ground.physicsBody = SKPhysicsBody(rectangleOfSize: ground.size)
        ground.physicsBody!.dynamic = false;
        self.addChild(ground)
        
        let location: CGPoint = CGPointMake(30, 230)
        let sprite: SKSpriteNode = SKSpriteNode(imageNamed:"Something")
        sprite.xScale = 0.5
        sprite.yScale = 0.5
        sprite.position = location
        sprite.physicsBody = SKPhysicsBody(circleOfRadius: CGRectGetWidth(sprite.frame) / 2)
        
        self.addChild(sprite)
        self.movableObject = sprite
        
        
        let myLabel: SKLabelNode = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "ゴール";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMaxX(self.frame) - CGRectGetWidth(myLabel.frame) / 2, y:CGRectGetHeight(myLabel.frame) + 150);
        
        self.addChild(myLabel)
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            movableObject?.physicsBody?.velocity = CGVectorMake(300, 0)
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
