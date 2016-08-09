//
//  YTChannel.swift
//  Dantang
//
//  Created by soft01 on 16/8/9.
//  Copyright © 2016年 song. All rights reserved.
//

import UIKit

class YTChannel: NSObject {

    var editable: Bool?
    var id: Int?
    var name: String?
    
    init(dict: [String: AnyObject]) {
        id = dict["id"] as? Int
        name = dict["name"] as? String
        editable = dict["editable"] as? Bool
    }
}
