//
//  MeasureState_ManualMeasureState.swift
//  Ruler
//
//  Created by Johannes Heinke Business on 02.10.18.
//  Copyright © 2018 Mikavaa. All rights reserved.
//

import Foundation
import SceneKit
import CoreGraphics
import UIKit

@available(iOS 12.0, *)
internal final class MeasureState_ManualMeasureState: MeasureState_General {
 
    private final var timer = Timer.init()
    private final var startPosition: SCNVector3? = nil

    private final func handleMeasureSituation() {
        self.interact { (controller) in
            
            func getCurrentPosition() -> SCNVector3 {
                return controller.handler.sceneView.unprojectPoint(SCNVector3Zero)
            }
            
            guard let startValue = self.startPosition else {
                self.startPosition = getCurrentPosition()
                self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { (_) in
                    guard let startValue = self.startPosition else {
                        return
                    }
                    let endValue = getCurrentPosition()
                    controller.handler.measurementLabel.text = "\(((endValue.distanceFromPos(pos: startValue) * 10000).rounded() / 100)) cm"
                })
                return
            }
            let endValue = getCurrentPosition()
            controller.handler.measurementLabel.text = "\(((endValue.distanceFromPos(pos: startValue) * 10000).rounded() / 100)) cm"
            controller.handler.resultButton.currentDistance = endValue.distanceFromPos(pos: startValue)
            controller.handler.currentState = controller.handler.walkingState
        }
    }
    
    override internal final func appaerState() {
        print("ManualMeasureState")
        self.handleMeasureSituation()
    }
    
    override internal final func disappaerState() {
        self.startPosition = nil
        self.timer.invalidate()
    }
    
    override internal final func handleTouchesBegan(at point: CGPoint) {
        self.handleMeasureSituation()
    }
}
