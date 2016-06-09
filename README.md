# Page Control Navigation

平铺导航模式是非常重要的导航模式，一般用于简单的扁平化信息浏览。扁平化信息是指这些信息之间没有从属的层次关系，如苹果自带的天气应用程序，每一个屏幕一个城市的天气信息，基于这种导航模式可以构建iOS中的实用型应用程序。（实用型应用程序完成的简单任务对用户输入要求很低，用户打开实用型应用程序是为了快速查看信息摘要或是在少数对象上执行简单任务）。本分屏导航是平铺导航模式的主要实现方式，主要涉及的控件有分屏控件（PageControl)和屏幕滚动视图（ScrollView)基于基于语言Swift2.2，环境XCode7.3.1。具体运行如下：

![pageview.gif](pageview.gif)

### 主要知识点：
* 初始化ScrollView
```swift
    //屏幕滚动视图
    @IBOutlet weak var scrollView: UIScrollView!
    //分屏控件
    @IBOutlet weak var pageControl: UIPageControl!
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
```
* 响应滚动事件，重新计算分屏控件位置
```swift
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        self.pageControl.currentPage = Int(offset.x) / 320
    }
```
* 响应点击分屏控件事件
```swift
    @IBAction func changePage(sender: AnyObject) {
        UIView.animateWithDuration(0.3, animations: {
            let whichPage = self.pageControl.currentPage
            //重新调整控件的偏移量
            self.scrollView.contentOffset = CGPointMake(320 * CGFloat(whichPage), 0)
        })
    }
```

如果喜欢的话，欢迎**Star**一下
