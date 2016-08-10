//
//  UIView+Extension.swift
//  Dantang
//
//  Created by soft01 on 16/8/10.
//  Copyright © 2016年 song. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    //裁剪 view 的圆角
    func clipRectCorner(direction: UIRectCorner,cornerRadius: CGFloat) -> Void {
        let cornerSize = CGSizeMake(cornerRadius, cornerRadius)
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: direction, cornerRadii: cornerSize)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.CGPath
        layer.addSublayer(maskLayer)
        layer.mask = maskLayer
    }
    
    //frame
    
    var x : CGFloat {
        get {
            return frame.origin.x
        }
        set(newValue) {
            var Reframe : CGRect = frame
            Reframe.origin.x = newValue
            frame = Reframe
            
        }
    }
    
    var y : CGFloat {
        get {
            return frame.origin.y
        }
        set(newValue) {
            var Reframe : CGRect = frame
            Reframe.origin.y = newValue
            frame = Reframe
            
        }
    }
    
    var height: CGFloat{
        set(newValue){
          
            var tempFrame: CGRect = frame
            tempFrame.size.height = newValue
            frame = tempFrame
        }
        
        get {
            return frame.size.height
        }
    }
    
    
    /// width
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.width = newValue
            frame = tempFrame
        }
    }
    
    /// size
    var size: CGSize {
        get {
            return frame.size
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size = newValue
            frame = tempFrame
        }
    }
    
    /// centerX
    var centerX: CGFloat {
        get {
            return center.x
        }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.x = newValue
            center = tempCenter
        }
    }
    
    /// centerY
    var centerY: CGFloat {
        get {
            return center.y
        }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.y = newValue
            center = tempCenter;
        }
    }
    
    
    
}

