//
//  LZPageVC.swift
//  LZPageControl
//
//  Created by JiWuChao on 2018/7/24.
//  Copyright © 2018年 JiWuChao. All rights reserved.
//

import UIKit

class LZPageVC: UIViewController {
    
    
    
    lazy var config:LZPageNavBarConfig = {
        
        let leftBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        leftBtn.backgroundColor = UIColor.red
        leftBtn.setTitle("left", for: .normal)
        leftBtn.setTitleColor(UIColor.white, for: .normal)
        leftBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        
        let rightBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        rightBtn.backgroundColor = UIColor.red
        rightBtn.setTitle("right", for: .normal)
        rightBtn.setTitleColor(UIColor.white, for: .normal)
        rightBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        //LZPageNavBarConfig.init(navFrame: CGRect(x: 0, y: 50, width: self.view.bounds.width, height: 44), isShowTrckLine: true, canScrollEnable: true, titleMargin: 10, firstTitleLeftMargin: 10, lastTitleRightMargin: 10, selectedCorlor: UIColor.orange, normalColor: UIColor.black)
        //    LZPageNavBarConfig.init(navFrame: CGRect(x: 0, y: 50, width: self.view.bounds.width, height: 44), coverBgColor: UIColor.black, coverAlpha: 0.5, coverMargin: 5, coverH: 25, coverRadius: 8, canScrollEnable: true, titleMargin: 20, firstTitleLeftMargin: 10, lastTitleRightMargin: 10, selectedColor: UIColor.red, normalColor: UIColor.black,isNeedScale:false,scaleRange:1.2)
        let config = LZPageNavBarConfig.init(navFrame: CGRect(x: 0, y: 100, width: self.view.bounds.width, height: 44), isShowTrckLine: true, canScrollEnable: true, titleMargin: 10, firstTitleLeftMargin: 10, lastTitleRightMargin: 10, selectedCorlor: UIColor.orange, normalColor: UIColor.black)
        //        config.leftBarItem = leftBtn
        config.rightBarItem = rightBtn
        //        config.isTrackDivide = true
        return config
    }()
    
    
    //    lazy var nav :LZPageNavBar = {
    //        let navBar = LZPageNavBar(frame: CGRect(x: 0, y: 50, width: UIScreen.main.bounds.width, height: 44), config: config)
    //            navBar.dataSource = self
    //            navBar.delegate = self
    //        return navBar
    //    }()
    //
    var titles:[String] = ["第1个","第2个会出问题吗","第3个","第4个"]
    
    
    var pageControl:LZPageControl = LZPageControl(frame: CGRect.zero, config: LZPageNavBarConfig())
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.view.backgroundColor = UIColor.white
        self.automaticallyAdjustsScrollViewInsets = false
        setPageControlView()
        
        //        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 10) {
        //            self.titles = ["第1个","第2个","第3个","第4个"]
        //            self.pageControl.reloadData()
        //        }
       
    }
    
    func setPageControlView() {
        pageControl = LZPageControl(frame: self.view.bounds, config: config)
        pageControl.backgroundColor = UIColor.white
        pageControl.delegate = self
        pageControl.dataSource = self
        view.addSubview(pageControl)
        pageControl.reloadData()
    }
    
    
    override func viewWillLayoutSubviews() {
        pageControl.frame = self.view.bounds
    }
    
   
   

}


extension LZPageVC :LZPageControlDelegate {
    func pageControl(control: LZPageControl, showIndex sIndex: Int) {
        //         print("showIndex:\(sIndex)")
    }
    
    func pageControlDidselectedLeftBar(control: LZPageControl) {
        print("点击了左边")
    }
    
    func pageControlDidselectedRightBar(control: LZPageControl) {
        print("点击了右边")
    }
    
}

extension LZPageVC :LZPageControlDataSource {
    func pageControlTitles(control: LZPageControl) -> [String] {
        return self.titles;
    }
}



extension LZPageVC:LZPageNavDataSource {
    
    func pageNavBarTitles(pageNavBar: LZPageNavBar) -> [String] {
        return titles
    }
    func pageControlChildren(pageControl: LZPageControl, viewAtIndex atIndex: Int) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let lbl = UILabel(frame: view.bounds)
        lbl.text = "第\(atIndex + 1)个"
        lbl.textAlignment = .center
        view.addSubview(lbl)
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        return view
    }
}







