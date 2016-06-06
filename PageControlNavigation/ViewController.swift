//
//  ViewController.swift
//  PageControlNavigation
//
//  Created by 张楚昭 on 16/5/28.
//  Copyright © 2016年 tianxing. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var page1: UIView!
    var page2: UIView!
    var page3: UIView!
    //屏幕滚动视图
    @IBOutlet weak var scrollView: UIScrollView!
    //分屏控件
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //设置scrollView的委托对象为当前视图控制器
        self.scrollView.delegate = self
        //初始化scrollView控件
        self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3, self.scrollView.frame.size.height)
        self.scrollView.frame = self.view.frame
        
        let mainStoryboard = self.storyboard
        
        let page1ViewController = mainStoryboard?.instantiateViewControllerWithIdentifier("page1")
        self.page1 = page1ViewController?.view
        self.page1.frame = CGRectMake(0.0, 0.0, 320.0, 480.0)
        
        let page2ViewController = mainStoryboard?.instantiateViewControllerWithIdentifier("page2")
        self.page2 = page2ViewController?.view
        self.page2.frame = CGRectMake(320.0, 0.0, 320.0, 480.0)
        
        let page3ViewController = mainStoryboard?.instantiateViewControllerWithIdentifier("page3")
        self.page3 = page3ViewController?.view
        self.page3.frame = CGRectMake(320.0 * 2, 0.0, 320.0, 480.0)
        
        self.scrollView.addSubview(page1)
        self.scrollView.addSubview(page2)
        self.scrollView.addSubview(page3)
        
    }
    
    //响应滚动事件，重新计算分屏控件位置
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        self.pageControl.currentPage = Int(offset.x) / 320
    }
    
    //响应点击分屏控件事件
    @IBAction func changePage(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: {
            let whichPage = self.pageControl.currentPage
            //重新调整控件的偏移量
            self.scrollView.contentOffset = CGPointMake(320 * CGFloat(whichPage), 0)
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

