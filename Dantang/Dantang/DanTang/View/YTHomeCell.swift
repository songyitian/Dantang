//
//  YTHomeCell.swift
//  Dantang
//
//  Created by soft01 on 16/8/10.
//  Copyright © 2016年 song. All rights reserved.
//

import UIKit
import Kingfisher
protocol YTHomeCellDelegate : NSObjectProtocol {
    func homeCellDidClickedFavoriteButton(button : UIButton)
}
class YTHomeCell: UITableViewCell {
    var delegate: YTHomeCellDelegate?
    

    @IBOutlet weak var bgImageView: UIImageView!
  
    @IBOutlet weak var placeholderBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
   
    @IBOutlet weak var favoriteBtn: UIButton!
    var homeItem: YTHomeItem? {
        didSet {
            let url = homeItem!.cover_image_url
            bgImageView.kf_setImageWithURL(NSURL(string: url!)!, placeholderImage: nil, optionsInfo: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
                self.placeholderBtn.hidden = true
            }
            titleLabel.text = homeItem!.title
            favoriteBtn.setTitle(" " + String(homeItem!.likes_count!) + " ", forState: .Normal)
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        favoriteBtn.layer.cornerRadius = favoriteBtn.height * 0.5
        favoriteBtn.layer.masksToBounds = true
        favoriteBtn.layer.rasterizationScale = UIScreen.mainScreen().scale
        favoriteBtn.layer.shouldRasterize = true
        bgImageView.layer.cornerRadius = kCornerRadius
        bgImageView.layer.masksToBounds = true
        bgImageView.layer.shouldRasterize = true
        bgImageView.layer.rasterizationScale = UIScreen.mainScreen().scale
        
    }

      @IBAction func placeholderBtn(sender: UIButton) {
        delegate!.homeCellDidClickedFavoriteButton(sender)
    }
    
}
