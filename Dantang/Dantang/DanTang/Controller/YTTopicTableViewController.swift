//
//  YTTopicTableViewController.swift
//  Dantang
//
//  Created by soft01 on 16/8/9.
//  Copyright © 2016年 song. All rights reserved.
//

import UIKit
let homeItemID = "homeItemID"

class YTTopicTableViewController: UITableViewController {
    var type = Int()
    //首页列表数据
    var items = [YTHomeItem]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = YTGlobalColor()
        setupTableView()
        
        //添加刷新空间
        refreshControl = YTRefreshControl()
        refreshControl?.beginRefreshing()
        refreshControl?.addTarget(self, action: #selector(loadHomeData), forControlEvents: .ValueChanged)
        
        //获取首页数据
        YTNetworkTool.shareNetworkTool.loadHomeInfo(type) { (homeItems) in
            self.items = homeItems
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
            
        }

   
    }
    func loadHomeData() {
        //获取首页数据
        YTNetworkTool.shareNetworkTool.loadHomeInfo(type) { (homeItems) in
            self.items = homeItems
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
        
    }
    
    func setupTableView() -> Void {
        tableView.rowHeight = 160
        tableView.separatorStyle = .None
        tableView.contentInset = UIEdgeInsetsMake(kTitlesViewY + kTitlesViewH, 0, tabBarController!.tabBar.height, 0)
        tableView.scrollIndicatorInsets = tableView.contentInset
        let nib = UINib(nibName: String(YTHomeCell), bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: homeItemID)
    }


  

    


}

extension YTTopicTableViewController: YTHomeCellDelegate {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count ?? 0
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let homeCell = tableView.dequeueReusableCellWithIdentifier(homeItemID) as! YTHomeCell
        homeCell.selectionStyle = .None
        homeCell.homeItem = items[indexPath.row]
        homeCell.delegate = self
        return homeCell
    }
    // MARK: - UITableViewDelegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailVC = YTDetailViewController()
       
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    // MARK: - YMHomeCellDelegate
    func homeCellDidClickedFavoriteButton(button: UIButton) {
        if !NSUserDefaults.standardUserDefaults().boolForKey(isLogin) {
            let loginVC = YTLoginViewController()
            loginVC.title = "登录"
            let nav = YTNavViewController(rootViewController: loginVC)
            presentViewController(nav, animated: true, completion: nil)
        } else {
            
        }
    }
}
