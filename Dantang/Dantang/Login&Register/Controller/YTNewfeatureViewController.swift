//
//  YTNewfeatureViewController.swift
//  Dantang
//
//  Created by soft01 on 16/8/9.
//  Copyright © 2016年 song. All rights reserved.
//

import UIKit
import SnapKit
/**
 * 1.YMNewfeatureLayout和YMNewfeatureCell私有类
 */
private let reuseIdentifier = "newFeatureID"

class YTNewfeatureViewController: UICollectionViewController {

    //布局对象
    private var layout: UICollectionViewFlowLayout = YTFeatureLayout()
    init(){
        super.init(collectionViewLayout:layout)
        collectionView?.showsVerticalScrollIndicator = false
    }
    // 子类必须实现的init构造方法
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       collectionView?.registerClass(YTFeatureCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    
    }
}

    extension YTNewfeatureViewController{
        override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return kNewFeatureCount
        }
        override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! YTFeatureCell
            // 设置自定义cell的imageIndex属性，决定显示哪个图片
            cell.imageIndex = indexPath.item
            return cell
        }
        // 完全显示一个cell之后调用
        override func collectionView(collectionView: UICollectionView, didEndDisplayingCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
            let path = collectionView.indexPathsForVisibleItems().last!
            // 如果显示的是最后一个cell
            if path.item == (kNewFeatureCount - 1) {
                let cell = collectionView.cellForItemAtIndexPath(path) as! YTFeatureCell
                // 设置最后一个cell显示button的动画效果
                cell.startBtnAnimation()
            }
        }
        
    }

    private class YTFeatureCell: UICollectionViewCell {
        private var imageIndex: Int?{
            didSet{

                iconView.image = UIImage(named: "walkthrough_\(imageIndex! + 1)")
            }
        }
        
        //构造函数
        override init(frame:CGRect){
            super.init(frame:frame)
            setupUI()
        }
        required init?(coder aDecoder: NSCoder) {
             fatalError("init(coder:) has not been implemented")
        }
        // 每个cell上添加UIImageView
        private lazy var iconView = UIImageView()
        // 为最后一个imageView添加UIButton
        private lazy var startButton: UIButton = {
            let btn = UIButton()
            btn.setBackgroundImage(UIImage(named: "btn_begin"), forState: .Normal)
            btn.addTarget(self, action: #selector(startButtonClick), forControlEvents: .TouchUpInside)
            btn.layer.masksToBounds = true
            btn.hidden = true
            return btn
        }()
        // 开始按钮触发方法
        @objc func startButtonClick() {
            // 设置根视图控制器为YMTabBarController
            UIApplication.sharedApplication().keyWindow?.rootViewController = YTTabBarControllerViewController()
        }
        func setupUI() {
            contentView.addSubview(iconView)
            contentView.addSubview(startButton)
            
            // 使用SnapKit第三方库添加约束
            iconView.snp_makeConstraints { (make) in
                make.edges.equalTo(contentView)
            }
            
            startButton.snp_makeConstraints { (make) in
                make.bottom.equalTo(contentView.snp_bottom).offset(-50)
                make.size.equalTo(CGSizeMake(150, 40))
                make.centerX.equalTo(0)
            }
            
        }
        func startBtnAnimation() {
            startButton.hidden = false
            //start animation
            
            startButton.transform = CGAffineTransformMakeScale(0.0, 0.0)
            startButton.userInteractionEnabled = false
            UIView.animateWithDuration(2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 5, options: UIViewAnimationOptions(rawValue: 0), animations: { () -> Void in
                // 清空形变
                self.startButton.transform = CGAffineTransformIdentity
                }, completion: { (_) -> Void in
                    self.startButton.userInteractionEnabled = true
            })
        }
        
}

    private class YTFeatureLayout : UICollectionViewFlowLayout{
        private override func prepareLayout() {
            //布局
            itemSize = UIScreen.mainScreen().bounds.size
            minimumLineSpacing = 0
            minimumInteritemSpacing = 0
            scrollDirection = .Horizontal
            
            collectionView?.showsVerticalScrollIndicator = false
            collectionView?.showsHorizontalScrollIndicator = false
            collectionView?.bounces = false
            collectionView?.pagingEnabled = true
        }
    }


