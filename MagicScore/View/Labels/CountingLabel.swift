//
//  CreditReportInfo.swift
//  MagicScore
//
//  Created by Thecafremo on 10/2/18.
//  Copyright © 2018 Magic Dealers. All rights reserved.
//

import Foundation
import UIKit

class CountingLabel: UILabel {
    
    //MARK: - Properties.
    
    private var startValue: Float!
    private var endValue: Float!
    
    private var totalDuration: Double!
    private var progressDuration: Double! = 0
    private var lastUpdateTimeInterval: Double!
    
    private var actionClosure: ActionClosure?

    private var displayLink: CADisplayLink?
    
    
    //MARK: - Private Methods.
    
    @objc
    private func update(for displayLink: CADisplayLink) {
        
        let now = Date.timeIntervalSinceReferenceDate
        self.progressDuration = self.progressDuration + now - self.lastUpdateTimeInterval
        self.lastUpdateTimeInterval = now
        
        if self.progressDuration >= self.totalDuration {
        
            self.displayLink?.invalidate()
            self.displayLink = nil
            
            self.actionClosure?()
        }
        
        self.text = String(Int(self.appropriateValue()))
    }
    
    
    //MARK: - Methods.
    
    func count(from startValue: Float, to endValue: Float, withDuration duration: Double, actionClosure: ActionClosure? = nil) {
        
        self.startValue = startValue
        self.endValue = endValue
        self.totalDuration = duration
        
        self.actionClosure = actionClosure

        let displayLink = CADisplayLink.init(target: self, selector: #selector(self.update(for:)))
        displayLink.frameInterval = 2
        
        displayLink.add(to: RunLoop.main, forMode: RunLoopMode.defaultRunLoopMode)
        displayLink.add(to: RunLoop.main, forMode: RunLoopMode.UITrackingRunLoopMode)
        
        self.displayLink = displayLink
        
        self.lastUpdateTimeInterval = Date.timeIntervalSinceReferenceDate
    }
    
    
    func finishCount() {
        
        self.displayLink?.invalidate()
        self.displayLink = nil
        
        self.actionClosure?()
        
        self.text = String(Int(self.endValue))
    }
    
    
    //MARK: - Helpers.
    
    private func appropriateValue() -> Float {
        
        if (self.progressDuration == 0) {
            return self.startValue
        }
        
        if (self.progressDuration >= self.totalDuration) {
            return self.endValue
        }
        
        return self.startValue + Float((self.progressDuration / self.totalDuration)) * (self.endValue - self.startValue)
    }
}
