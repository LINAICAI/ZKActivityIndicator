//
//  ZKActivityIndicator.swift
//  ZKActivityIndicator_Example
//
//  Created by LINAICAI on 2019/1/14.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class ZKActivityIndicator: UIView {
    private let indicatorWidth: CGFloat = 3.0
    var isAnimating = false
    var hidesWhenStopped = false

    lazy var backgroundLayer: CAShapeLayer = {
        let backgroundLayer = CAShapeLayer()
        let path = UIBezierPath(arcCenter: center, radius: (frame.size.height - indicatorWidth) / 2.0, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        backgroundLayer.path = path.cgPath
        backgroundLayer.lineWidth = indicatorWidth
        backgroundLayer.strokeStart = 0
        backgroundLayer.strokeEnd = 1.0
        backgroundLayer.fillColor = UIColor.clear.cgColor
        backgroundLayer.strokeColor = UIColor(white: 1.0, alpha: 0.3).cgColor
        return backgroundLayer
    }()

    lazy var animateLayer: CAShapeLayer = {
        let animateLayer = CAShapeLayer()
        let path = UIBezierPath(arcCenter: center, radius: (frame.size.height - indicatorWidth) / 2.0, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        animateLayer.path = path.cgPath
        animateLayer.lineWidth = indicatorWidth
        animateLayer.strokeStart = 0
        animateLayer.strokeEnd = 0.3
        animateLayer.lineJoin = kCALineJoinRound
        animateLayer.lineCap = kCALineCapRound
        animateLayer.fillColor = UIColor.clear.cgColor
        animateLayer.strokeColor = UIColor(white: 1.0, alpha: 1.0).cgColor
        return animateLayer
    }()

    convenience init() {
        self.init(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 40.0, height: 40.0)))
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.addSublayer(backgroundLayer)
        layer.addSublayer(animateLayer)

        isHidden = true
    }

    func startAnimating() {
        if isAnimating {
            return
        }

        if layer.animation(forKey: "rotationAnimation") != nil {
            // resume animation
            let pausedTime = layer.timeOffset
            layer.speed = 1.0
            layer.timeOffset = 0.0
            layer.beginTime = 0.0
            let timeSincePause = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
            layer.beginTime = timeSincePause
        } else {
            // create animation
            let animation = CABasicAnimation(keyPath: "transform.rotation")
            animation.fromValue = 0
            animation.toValue = Double.pi * 2.0
            animation.duration = 1.0
            animation.isCumulative = true
            animation.repeatCount = Float.infinity
            animation.isRemovedOnCompletion = false
            animation.fillMode = kCAFillModeForwards
            layer.add(animation, forKey: "rotationAnimation")
        }

        isHidden = false
        isAnimating = true
    }

    func stopAnimating() {
        if !isAnimating {
            return
        }

        let pausedTime = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0.0
        layer.timeOffset = pausedTime

        isAnimating = false
        if hidesWhenStopped {
            isHidden = true
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
}
