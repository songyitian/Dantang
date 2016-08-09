//
//  YTDantangViewController.swift
//  Dantang
//
//  Created by soft01 on 16/8/9.
//  Copyright © 2016年 song. All rights reserved.
//

import UIKit

class YTDantangViewController: YTMainViewController {

    var channels = [YTChannel]()
    //biaoqian
    weak var titleView = UIView()
    
    //底部红色指示器
    
    weak var indicatorView = UIView()
    
    weak var contentView = UIScrollView()
    //选中当前按钮
    weak var selectedButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置导航栏
        setupNav()
        //获取首页顶部数据
        YTNetworkTool.shareNetworkTool.loadHomeTopData {[weak self] (ym_channels) in
            for channel in ym_channels {
                let vc = YTTopicTableViewController()
                vc.title = channel.name
                vc.type = channel.id!
                self?.addChildViewController(vc)
                
            }
        }
        
        //设置顶部标签栏
        self.setupTitlesView()
//        底部的scrollView
        self.setupContentView()
    }
    func setupTitlesView() -> Void {
        
    }
    
    
    func setupContentView() -> Void {
        automaticallyAdjustsScrollViewInsets = false
        
        let contentView = UIScrollView()
        contentView.frame = view.bounds
        contentView.delegate = self
        contentView.contentSize = CGSizeMake(contentView.width * (CGFloat(childViewControllers.count)), 0)
        
    }
    //初始化zi控制器
    func setupChildViewControllers() {
        for channel in channels {
            let vc = YTTopicTableViewController()
            vc.title = channel.name
            addChildViewController(vc)
        }
    }
    func setupNav() -> Void {
        view.backgroundColor = UIColor.whiteColor()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Feed_SearchBtn_18x18_"), style: .Plain, target: self, action: #selector(dantangRightBBClick))
    }
    func dantangRightBBClick() -> Void {
        let searchBarViewController = YTSearchViewController()
        navigationController?.pushViewController(searchBarViewController, animated: true)
        
    }
    

}

extension YTDantangViewController: UIScrollViewDelegate {
    
}
