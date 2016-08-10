//
//  YTRefreshView.swift
//  Dantang
//
//  Created by soft01 on 16/8/10.
//  Copyright © 2016年 song. All rights reserved.
//

import UIKit

class YTRefreshView: UIView {

    @IBOutlet weak var arrowImageView: UIImageView!
    
    @IBOutlet weak var loadImageView: UIImageView!

    @IBOutlet weak var tipView: UIView!
//    旋转箭头
    func rotationArrowIcon(flag: Bool) {
        var angle = M_PI
        
        angle += flag ? -0.01 : 0.01
        UIView.animateWithDuration(kAnimationDuration){
            self.arrowImageView.transform = CGAffineTransformRotate(self.arrowImageView.transform,CGFloat( angle))
        }
        
    }
    //开始转圈动画
    func startLoadingViewAnimation() {
        tipView.hidden = true
        //创建动画
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = 2 * M_PI
        animation.duration = 1
        animation.repeatCount = MAXFLOAT
        animation.removedOnCompletion = false
        loadImageView.layer.addAnimation(animation, forKey: nil)
    }
    
    //停止转动
    func stopLoadingViewAnimation() {
        tipView.hidden = false
        loadImageView.layer.removeAllAnimations()
    }
    
    class func refreshView() ->YTRefreshView {
        return NSBundle.mainBundle().loadNibNamed(String(self), owner: nil, options: nil).last as! YTRefreshView
    }
}
