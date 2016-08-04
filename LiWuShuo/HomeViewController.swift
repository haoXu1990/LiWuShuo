//
//  HomeViewController.swift
//  LiWuShuo
//
//  Created by 房慧科技 on 16/8/1.
//  Copyright © 2016年 fanghuikeji. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    var categoryTitles: [NSString]
    {
        return ["精选", "海淘", "创意生活", "送女票", "科技范", "送爸妈", "送基友", "送闺蜜", "送同事", "送宝贝", "设计感", "文艺范", "奇葩搞怪", "萌萌哒"]
    }

    var cacheCategoryViews = [UIView]()


    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }


    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupUIFrame()
    }

    // MARK: - 初始化视图
    private func setupUI() {

        view.backgroundColor = Color_GlobalBackground
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(gifTarget: self, action: #selector(HomeViewController.gifBtnAction))
        navigationItem.titleView = titleImageView

        view.addSubview(popoverCategoryView)
    }


    private func setupUIFrame() {

        popoverCategoryView.frame = CGRectMake(0, 0, view.bounds.width, 44)

    }


    // MARK: -  事件
    @objc private func gifBtnAction() {

        NSNotificationCenter.defaultCenter().postNotificationName(Notif_Login, object: nil)
    }

    // MARK: - 懒加载
    private lazy var titleImageView:UIImageView = {
        let image = UIImage.init(named: "logo")
        let titleImageView = UIImageView.init(image: image)
        titleImageView.contentMode = UIViewContentMode.ScaleAspectFit
        titleImageView.bounds = CGRectMake(0, 0, 20.0 * (image!.size.width / image!.size.height), 20.0)

        return titleImageView
    }()


    private lazy var scrollView: UIScrollView = {

        let view = UIScrollView()
        view.delegate = self
        view.showsHorizontalScrollIndicator = false
        view.pagingEnabled = true
        return view
    }()

    private lazy var popoverCategoryView: PopoverCategoryView = {
        let view = PopoverCategoryView.popoverCategoryView()
        view.delegate = self
        view.categoryTitles = self.categoryTitles

        return view
    }()
}


// MARK: - 代理
extension HomeViewController:UIScrollViewDelegate{

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {


    }

}

extension HomeViewController: PopoverCategoryViewDelegate {

    func selectedCateGoryEndWithIndex(index: NSInteger) {


    }
}