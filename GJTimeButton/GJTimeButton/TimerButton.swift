//
//  AppDelegate.swift
//  GJTimeButton
//
//  Created by gaojun on 2017/11/2.
//  Copyright © 2017年 GJ. All rights reserved.
//

import UIKit
import QuartzCore

class TimerButton: UIButton {
    
    let timeLength = 60
    var currentTime = 0
    
    var isWorking:Bool = false
    
    var start = ""
    var prefix = ""
    
    var clickBtnEvent: (() -> Void)?
    
    lazy var timeLayer: CATextLayer = {
        let l = CATextLayer()
        l.alignmentMode = kCAAlignmentCenter
        l.font = UIFont.systemFont(ofSize: 13.0)
        l.fontSize = 13
        l.foregroundColor = UIColor.gray.cgColor
        l.contentsScale = 2
        return l
    }()
    
    var timer: Timer?
    
    func setup(_ startTitle: String?,timeTitlePrefix: String?) {
        layer.addSublayer(timeLayer)
        if startTitle != nil {
            start = startTitle!
        }
        if timeTitlePrefix != nil {
            prefix = timeTitlePrefix!
        }
        restore()
        self.addTarget(self, action: #selector(clickBtn), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        timeLayer.frame = CGRect(x: 0, y: 0, width: bounds.width, height: 18)
        timeLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)
        
    }
    
    @objc func clockEvent() {
        update()
        if currentTime <= 0 {
            restore()
        }
        currentTime -= 1
    }
    
    @objc fileprivate func update() {
        timeLayer.string = prefix + "\(currentTime)s"
    }
    
    @objc fileprivate func restore() {
        isWorking = false
        currentTime = timeLength
        timeLayer.string = start
        timerChangeStatus(false)
        self.isSelected = false
    }
    
    
    @objc fileprivate func clickBtn(_ sender: TimerButton) {
        sender.isSelected = true
        timerChangeStatus(true)
        if clickBtnEvent != nil {
            clickBtnEvent!()
        }
    }
    
    @objc fileprivate func timerChangeStatus(_ fire: Bool) {
        if fire {
            if timer == nil {
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(clockEvent), userInfo: nil, repeats: true)
            }
        } else {
            timer?.invalidate()
            timer = nil
        }
    }
}
