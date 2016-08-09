//
//  YTTabBarControllerViewController.swift
//  Dantang
//
//  Created by soft01 on 16/8/9.
//  Copyright © 2016年 song. All rights reserved.
//

import UIKit

class YTTabBarControllerViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = UIColor(red: 245 / 255, green: 80 / 255, blue: 83 / 255, alpha: 1.0)
        //添加子控制器
        addChildViewControllers()
    }
    
    private func addChildViewControllers() {
        addChildViewController("YTDantangViewController", title: "单糖", imageName: "TabBar_home_23x23_")
        addChildViewController("YTProductViewController", title: "单品", imageName: "TabBar_gift_23x23_")
        addChildViewController("YTCategoryViewController", title: "分类", imageName: "TabBar_category_23x23_")
        addChildViewController("YTMeViewController", title: "我", imageName: "TabBar_me_boy_23x23_")
    }
    
    
    private func addChildViewController(childControllerName: String , title: String , imageName: String) {
        // 动态获取命名空间(DanTang)
        let ns = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        // 将字符串转化为类，默认情况下命名空间就是项目名称，但是命名空间可以修改
        // DanTang.YMDanTangViewController
        let cls: AnyClass? = NSClassFromString(ns + "." + childControllerName)
        let vcClass = cls as! UIViewController.Type
        let vc = vcClass.init()

        // 设置对应的数据
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "selected")
        vc.title = title
        // 给每个控制器包装一个导航控制器
        let nav = YTNavViewController()
        nav.addChildViewController(vc)
        // 当前tabBarController添加nav控制器
        addChildViewController(nav)
        
        
        
        
    }

 

}
