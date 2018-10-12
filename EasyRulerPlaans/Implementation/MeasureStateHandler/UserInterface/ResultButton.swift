//
//  ResultButton.swift
//  Ruler
//
//  Created by Johannes Heinke Business on 02.10.18.
//  Copyright © 2018 Mikavaa. All rights reserved.
//

import Foundation
import SceneKit
import UIKit

@available(iOS 12.0, *)
internal final class ResultButton: UIButton {
    
    private final let handler: MeasureState_Handler
    internal final var currentDistance: Float = 0.0
    
    init(frame: CGRect, handler: MeasureState_Handler) {
        self.handler = handler
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    override internal final func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.handler.currentState.interact { (controller) in
            controller.viewController.handle(currentDistance)
        }
        self.handler.currentState = self.handler.endState
    }
}
