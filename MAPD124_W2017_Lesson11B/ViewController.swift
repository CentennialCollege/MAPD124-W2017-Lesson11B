//
//  ViewController.swift
//  MAPD124_W2017_Lesson11B
//
//  Created by Tom Tsiliopoulos on 2017-03-28.
//  Copyright © 2017 Tom Tsiliopoulos. All rights reserved.
//

import UIKit
import CoreGraphics

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    private var gestureStartPoint: CGPoint!
    private static let minimumGestureLength = Float(25.0)
    private static let maximumVariance = Float(5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            gestureStartPoint = touch.location(in: self.view)
            print ("Initial X: \(gestureStartPoint.x),  Initial Y: \(gestureStartPoint.y)")
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let gestureStartPoint = self.gestureStartPoint {
            let currentPosition = touch.location(in: self.view)
            
            let deltaX = fabsf(Float(gestureStartPoint.x - currentPosition.x))
            let deltaY = fabsf(Float(gestureStartPoint.y - currentPosition.y))
            
            if deltaX >= ViewController.minimumGestureLength && deltaY <= ViewController.maximumVariance {
                messageLabel.text = "horizontal swipe detected"
                print ("Swipe X: \(currentPosition.x),  Swipe Y: \(currentPosition.y)")
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() +
                    Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC), execute: {
                        self.messageLabel.text = ""
                })
            }
            else if deltaY >= ViewController.minimumGestureLength && deltaX <= ViewController.maximumVariance {
                messageLabel.text = "vertical swipe detected"
                print ("Swipe X: \(currentPosition.x),  Swipe Y: \(currentPosition.y)")
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() +
                    Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC), execute: {
                        self.messageLabel.text = ""
                })

            }
        }
    }



}

