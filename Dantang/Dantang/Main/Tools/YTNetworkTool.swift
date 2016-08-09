//
//  YTNetworkTool.swift
//  Dantang
//
//  Created by soft01 on 16/8/9.
//  Copyright © 2016年 song. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON

class YTNetworkTool: NSObject {
    /**
     *  单例
     */
    static let shareNetworkTool = YTNetworkTool()
    //获取首页数据
    func loadHomeInfo(id: Int,finished:(homeItems: [YTHomeItem]) ->()) {
        //        let url = BASE_URL + "v1/channels/\(id)/items?gender=1&generation=1&limit=20&offset=0"
        let url = BASE_URL + "v1/channel/\(id)/items"
        let params = ["gender" : 1,
                      "generation" : 1,
                      "limit" : 20,
                      "offset" : 0]
       Alamofire.request(.GET,url,parameters: params).responseJSON { (response) in
        guard response.result.isSuccess else {
            SVProgressHUD.showErrorWithStatus("加载失败")
            
            return
        }
        if let value = response.result.value {
            let dict = JSON(value)
            let code = dict["code"].intValue
            let message = dict["message"].stringValue
            guard code == RETURN_OK else {
                SVProgressHUD.showInfoWithStatus(message)
                return
            }
            let data = dict["data"].dictionary
            //转成模型
            if let items = data!["items"]?.arrayObject {
                var homeItems = [YTHomeItem]()
                for item in items {
                    let homeItem = YTHomeItem(dict: item as! [String: AnyObject])
                    homeItems.append(homeItem)
                }
                finished(homeItems: homeItems)
            }
        }
        
        }
        
        
    }
    /// 获取首页顶部选择数据
    func loadHomeTopData(finished:(ym_channels: [YTChannel]) -> ()){
        let url = BASE_URL + "v2/channels/preset"
        let params = ["gender" : 1,
                      "genderation" : 1]
        Alamofire.request(.GET,url,parameters: params).responseJSON { (response) in
            guard response.result.isSuccess else {
                SVProgressHUD.showErrorWithStatus("加载失败...")
                return
            }
            if let value = response.result.value {
                let dict = JSON(value)
                let code = dict["code"].intValue
                let message = dict["message"].stringValue
                guard code == RETURN_OK else {
                    SVProgressHUD.showInfoWithStatus(message)
                    return
                }
                SVProgressHUD.dismiss()
                let data = dict["data"].dictionary
                if let channels = data!["channel"]?.arrayObject {
                    var ym_channels = [YTChannel]()
                    for channel in channels {
                        let ym_channel = YTChannel(dict: channel as! [String : AnyObject])
                        ym_channels.append(ym_channel)
                    }
                    finished(ym_channels: ym_channels)
                }
            }
        }
    }
    
        
        

}
