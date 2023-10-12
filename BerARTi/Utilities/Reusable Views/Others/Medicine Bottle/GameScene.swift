//
//  GameScene.swift
//  BerARTi
//
//  Created by Vanessa Ladiocha on 04/11/22.
//

import SpriteKit
import GameplayKit
import CoreMotion

class GameScene: SKScene {
    var btnReset: SKNode! = nil
    var btnAddPill: SKNode! = nil
    private let motionManager = CMMotionManager()
    // let drinkMedicine = 3
    
    override func didMove(to view: SKView) {
        motionManager.startAccelerometerUpdates()
        createAddButton()
        createResetButton()
        createBottle()
        createPill(amount: 5)
    }
    
    func createAddButton() {
        let presetTexture = SKTexture(imageNamed: "Add")
        btnAddPill = SKSpriteNode(texture: presetTexture)
        btnAddPill.position = CGPoint(x:self.frame.midX + 120, y:self.frame.midY + 352);
        addChild(btnAddPill)
    }
    
    func createResetButton() {
        let presetTexture = SKTexture(imageNamed: "Reset")
        btnReset = SKSpriteNode(texture: presetTexture)
        btnReset.position = CGPoint(x:self.frame.midX - 100, y:self.frame.midY + 350);
        addChild(btnReset)
    }
    
    func createPill(amount: Int) {
        for _ in 1...amount {
            let presetTexture = SKTexture(imageNamed: "Pill")
            let pill = SKSpriteNode(texture: presetTexture)
            pill.position = CGPoint(x: self.frame.midX, y: -40)
            pill.physicsBody = SKPhysicsBody(texture: presetTexture, size: presetTexture.size())
            pill.physicsBody?.affectedByGravity = true
            pill.physicsBody?.isDynamic = true
            pill.physicsBody?.allowsRotation = true
            pill.physicsBody?.pinned = false
            pill.physicsBody?.angularDamping = 0.1
            pill.physicsBody?.linearDamping = 0.1
            
            // pill.size = CGSize(width: 100, height: 80)
            
            addChild(pill)
            
            // manager.accelerometerUpdateInterval = 1
        }
    }
    
    func goToGameScene() {
        if let view = self.view {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = false
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
    
    func createBottle() {
        if let view = self.view {
            let presetTexture = SKTexture(imageNamed: "Bottle")
            let bottle = SKSpriteNode(texture: presetTexture)
            bottle.position = CGPoint(x: view.frame.midX, y: view.frame.midY)
            bottle.size = CGSize(width: 200, height: 400)
            addChild(bottle)
        } else {
            print("view doesn't exist")
        }
    }
    
    func createGround() {
        let presetTexture = SKTexture(imageNamed: "ground")
        let ground = SKSpriteNode(texture: presetTexture)
        ground.position = CGPoint(x: 6.555, y: -135.447)
        ground.size = CGSize(width: 510.459, height: 94.85)
        
        ground.physicsBody = SKPhysicsBody(texture: presetTexture, size: presetTexture.size())
        
        ground.physicsBody?.affectedByGravity = false
        ground.physicsBody?.isDynamic = false
        ground.physicsBody?.allowsRotation = false
        ground.physicsBody?.pinned = false
        
        addChild(ground)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        if let accelerometerData = motionManager.accelerometerData {
            physicsWorld.gravity = CGVector(dx: accelerometerData.acceleration.x * 9.8, dy: accelerometerData.acceleration.y * 9.8)
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            // Get the location of the touch in this scene
            let location = touch.location(in: self)
            createPill(amount: 1)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            if btnReset.contains(location) {
                //self.removeAllChildren()
                //self.removeAllActions()
                goToGameScene()
            }
        }
    }
    
}
