//
//  CookSkillCardOverlayView.swift
//  cookpad_demo
//
//  Created by 堀江健太朗 on 2017/09/15.
//  Copyright © 2017年 kentaro. All rights reserved.
//

import UIKit
import Koloda

private let overlayRightImageName = "yes"
private let overlayLeftImageName = "no"

class SkillOverlayView: OverlayView {
    
    @IBOutlet lazy var overlayImageView: UIImageView! = {
        [unowned self] in
        
        var imageView = UIImageView(frame: self.bounds)
        self.addSubview(imageView)
        
        return imageView
        }()
    
    override var overlayState: SwipeResultDirection?  {
        didSet {
            switch overlayState {
            case .left? :
                overlayImageView.image = UIImage(named: overlayLeftImageName)
            case .right? :
                overlayImageView.image = UIImage(named: overlayRightImageName)
            default:
                overlayImageView.image = nil
            }
            
        }
    }
    
}
