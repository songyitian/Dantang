//
//  YTMainViewController.swift
//  Dantang
//
//  Created by soft01 on 16/8/9.
//  Copyright © 2016年 song. All rights reserved.
//

import UIKit
import SVProgressHUD
import FDFullscreenPopGesture

class YTMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //背景颜色
        view.backgroundColor = YTGlobalColor()
        
        navigationController?.fd_prefersNavigationBarHidden = true
        SVProgressHUD.setDefaultStyle(SVProgressHUDStyle.Custom)
        SVProgressHUD.setMinimumDismissTimeInterval(1.0)
        SVProgressHUD.setBackgroundColor(UIColor(red: 0, green: 0, blue: 0, alpha: 0.5))
        SVProgressHUD.setForegroundColor(UIColor.whiteColor())
    }

   
    

 

}
