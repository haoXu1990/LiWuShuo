//
//  PopoverCategoryView.swift
//  LiWuShuo
//
//  Created by 房慧科技 on 16/8/4.
//  Copyright © 2016年 fanghuikeji. All rights reserved.
//

import UIKit

protocol PopoverCategoryViewDelegate: NSObjectProtocol {

    func selectedCateGoryEndWithIndex(index: NSInteger)
}

class PopoverCategoryView: UIView {

    weak var delegate: PopoverCategoryViewDelegate?
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var switchBtn: UIButton!
    @IBOutlet weak var switchCover: UIView!


    /// 分类标题
    var categoryTitles:[NSString]?{

        didSet{

            createScrollCategory(categoryTitles!)

        }
    }

    // 弹出分类视图的按钮列数
    let popverBtnColumn = 4

    // 缓存滚动分类按钮
    var cacheScrollCategoryBtns = [UIButton]()

    // 缓存格子分类按钮
    var cacheSquareCategoryBtns = [UIButton]()

    // 当前所选的滚动分类按钮
    var selectedScrollCategoryBtn:UIButton?

    // 当前所选格子的分类按钮
    var selectedSquareCategoryBtn:UIButton?

    // 弹出的格子分类视图
    var popoverView:UIView?

    // 是否显示格式分类视图
    var showingPopoverView = false

    class func popoverCategoryView() -> PopoverCategoryView {

        let view = NSBundle.mainBundle().loadNibNamed("PopoverCategoryView", owner: nil, options: nil).last as! PopoverCategoryView

        return view
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        setupUIFrame()
    }


    private func setupUI() {
        backgroundColor = UIColor.whiteColor()


        scrollView.addSubview(scrollBottomLineView)


    }

    private func setupUIFrame() {
        /// 设置scrollView contentSize
        if let lastCategoryBtn = cacheScrollCategoryBtns.last {
            scrollView.contentSize = CGSizeMake(CGRectGetMaxX(lastCategoryBtn.frame), 0)
        }

        /// 设置底部线条frame
        if let categoryBtn = selectedScrollCategoryBtn {
            scrollBottomLineView.center = CGPointMake(categoryBtn.center.x, bounds.height - 2.0)
            scrollBottomLineView.bounds = CGRect(origin: CGPointZero, size: CGSizeMake(categoryBtn.bounds.width - 10.0, 2.0))
        }

    }



    private func createBtn(title: NSString) -> UIButton {
        let btn = UIButton()
        btn.setTitle(title as String, forState: UIControlState.Normal)
        btn.titleLabel?.font = UIFont.systemFontOfSize(13.0)
        btn.setTitleColor(UIColor.init(red: 102.0/255.0, green: 102.0/255.0, blue: 102.0/255.0, alpha: 1.0), forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.init(red: 251.0/255.0, green: 45.0/255.0, blue: 71.0/255.0, alpha: 1.0), forState: UIControlState.Selected)
        return btn
    }


    private func createScrollCategory(titles: [NSString]) {

        for i in 0..<titles.count {
            let title = titles[i]
            let btn = createBtn(title)
            btn.tag = i
            let width:CGFloat = title.boundingRectWithSize(CGSizeZero, options: NSStringDrawingOptions.init(rawValue: 0), attributes: [NSFontAttributeName : btn.titleLabel!.font], context: nil).width + 20
            let x:CGFloat = cacheScrollCategoryBtns.last == nil ? 5.0 : CGRectGetMaxX(cacheScrollCategoryBtns.last!.frame)
            btn.frame = CGRectMake(x, 0, width, 44.0)

            btn.addTarget(self, action: #selector(PopoverCategoryView.scrollCategoryBtnAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)

            scrollView.addSubview(btn)
            cacheScrollCategoryBtns.append(btn)

            if i == 0 {

                scrollCategoryBtnAction(btn)

            }


        }

    }


    // MARK: - 懒加载
    private var scrollBottomLineView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 251.0/255.0, green: 45.0/255.0, blue: 71.0/255.0, alpha: 1.0)
        return view
    }()

    // MARK: - 事件
    @objc private func scrollCategoryBtnAction(sender: UIButton) {

        if let btn = selectedScrollCategoryBtn  {
            btn.selected = false
        }

        sender.selected = !sender.selected

        selectedScrollCategoryBtn = sender

        if sender.center.x < bounds.width * 0.5 {
            scrollView.setContentOffset(CGPointZero, animated: true)
        }
        else if scrollView.contentSize.width > bounds.width && sender.center.x > bounds.width * 0.5 && sender.center.x < (scrollView.contentSize.width - bounds.width * 0.5) {
            scrollView.setContentOffset(CGPointMake(sender.frame.origin.x + sender.bounds.width * 0.5 - bounds.width * 0.5, 0), animated: true)
        }
        else{
            scrollView.setContentOffset(CGPointMake(max(scrollView.contentSize.width - scrollView.bounds.size.width, 0), 0), animated: true)
        }

        setNeedsLayout()
        delegate?.selectedCateGoryEndWithIndex(sender.tag)

    }














}
