//
//  ViewController.swift
//  Sample-CoreAnimation
//
//  Created by Ronaldo GomesJr on 2/11/2015.
//  Copyright © 2015 TechnophileIT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var startButton:UIButton!
    
    var box1:UIView!
    var box2:UIView!
    
    var moon:UIView!
    var spaceship:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.startButton = UIButton(type: .Custom)
        self.startButton.translatesAutoresizingMaskIntoConstraints = false
        self.startButton.setTitle("Start", forState: .Normal)
        self.startButton.setTitleColor(UIColor.blueColor(), forState: .Normal)
        self.startButton.addTarget(self, action: "start:", forControlEvents: .TouchUpInside)
        self.view.addSubview(self.startButton)
        
        self.box1 = UIView()
        box1.translatesAutoresizingMaskIntoConstraints = false
        box1.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(self.box1)

        self.box2 = UIView()
        box2.translatesAutoresizingMaskIntoConstraints = false
        box2.backgroundColor = UIColor.greenColor()
        self.view.addSubview(self.box2)
        
        self.moon = UIView()
        moon.translatesAutoresizingMaskIntoConstraints = false
        moon.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(self.moon)

        self.spaceship = UIView()
        spaceship.translatesAutoresizingMaskIntoConstraints = false
        spaceship.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.spaceship)
        
        setupConstraint()
        
        let boundingRect = CGRectMake(-75, -100, 150, 150)
        
        let orbit = CAKeyframeAnimation()
        orbit.keyPath = "position"
        orbit.path = CGPathCreateWithEllipseInRect(boundingRect, nil)
        orbit.duration = 4
        orbit.additive = true
        orbit.repeatCount = HUGE
        orbit.calculationMode = kCAAnimationPaced
        orbit.rotationMode = kCAAnimationRotateAuto
        
        self.spaceship.layer.addAnimation(orbit, forKey: "orbit")
    }

    private func setupConstraint() {
        let views = ["startButton": self.startButton, "box1": self.box1, "box2": self.box2, "moon": self.moon, "spaceship": self.spaceship]
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[startButton]|", options: .AlignAllTop, metrics: nil, views: views))
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-64-[startButton]", options: .AlignAllLeft, metrics: nil, views: views))
        
        self.box1.addConstraint(NSLayoutConstraint(item: self.box1, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 10))
        self.box1.addConstraint(NSLayoutConstraint(item: self.box1, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 10))

        self.box2.addConstraint(NSLayoutConstraint(item: self.box2, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 10))
        self.box2.addConstraint(NSLayoutConstraint(item: self.box2, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 10))

        self.moon.addConstraint(NSLayoutConstraint(item: self.moon, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 50))
        self.moon.addConstraint(NSLayoutConstraint(item: self.moon, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 50))

        self.spaceship.addConstraint(NSLayoutConstraint(item: self.spaceship, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 10))
        self.spaceship.addConstraint(NSLayoutConstraint(item: self.spaceship, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 10))
        
        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[box1]", options: .AlignAllTop, metrics: nil, views: views))
        self.view.addConstraint(NSLayoutConstraint(item: self.box1, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0))

        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[box2]", options: .AlignAllTop, metrics: nil, views: views))
        self.view.addConstraint(NSLayoutConstraint(item: self.box2, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.box1, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 10.0))

        self.view.addConstraint(NSLayoutConstraint(item: self.moon, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.moon, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.box1, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 200.0))

        self.view.addConstraint(NSLayoutConstraint(item: self.spaceship, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.spaceship, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.moon, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 10.0))
        
    }
    
    func start(sender:UIButton) {
    
        let animation = CABasicAnimation()
        animation.keyPath = "position.x"
        animation.fromValue = 10
        animation.toValue = self.view.frame.size.width - 10
        animation.duration = 1
        
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
//        This is a possible solution but not recommeded
//        animation.removedOnCompletion = false
//        animation.fillMode = kCAFillModeForwards
        
        self.box1.layer.addAnimation(animation, forKey: "basic")
        self.box1.layer.position = CGPointMake(self.view.frame.size.width - 10, self.box1.layer.position.y)

//        animation.beginTime = CACurrentMediaTime() + 0.5
//        animation.fromValue = 50
//        self.box2.layer.addAnimation(animation, forKey: "basic")
//        self.box2.layer.position = CGPointMake(300, self.box2.layer.position.y)
        
    }

}

