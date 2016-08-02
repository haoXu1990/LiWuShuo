//
//  MeViewController.swift
//  LiWuShuo
//
//  Created by 房慧科技 on 16/8/1.
//  Copyright © 2016年 fanghuikeji. All rights reserved.
//

import UIKit
import SnapKit

private let cellReuseIdentifier  = "Cell"
class MeViewController: BaseViewController {

    var tableview : UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()

    }


    //Mark - 初始化UI
    private func setupUI() {
        hideNavigationBar(false)
        setupBarView()
        setupTabelView()
    }

    /**
     隐藏导航条
     @parameter showBgImage: 是否显示导航条背景
     */
    private func hideNavigationBar(showBgImage: Bool) {

        automaticallyAdjustsScrollViewInsets = false;
        navigationController?.navigationBar.translucent = true
        navigationController?.navigationBar.setBackgroundImage(showBgImage ? UIImage(named: "me_profilebackground") : UIImage(), forBarMetrics: UIBarMetrics.Default)

        navigationController?.navigationBar.shadowImage = UIImage()
    }


    private func setupBarView() {

        let mailButton = UIButton(x: 0, iconName: "me_message", target: self, action: #selector(MeViewController.mailBtnAction), imageEdgeInsets: UIEdgeInsetsMake(0, -20, 0, 0))
        let alarmclockButton  = UIButton.init(x: 44, iconName: "me_giftremind", target: self, action: #selector(MeViewController.alarmclockBtnAction), imageEdgeInsets: UIEdgeInsetsMake(0, -20, 0, 0))
        leftBarView.addSubview(alarmclockButton)
        leftBarView.addSubview(mailButton)


        let qrcodeButton = UIButton.init(x: 0, iconName: "me_scan", target: self, action: #selector(MeViewController.qrcodeBtnAction), imageEdgeInsets: UIEdgeInsetsMake(0, 0, 0, -20))

        let settingButton = UIButton.init(x: 44, iconName: "iconSettings", target: self, action: #selector(MeViewController.settingBtnAction), imageEdgeInsets: UIEdgeInsetsMake(0, 0, 0, -44))

        rightBarView.addSubview(qrcodeButton)
        rightBarView.addSubview(settingButton)


        let leftBarItem = UIBarButtonItem()
        leftBarItem.customView = leftBarView

        let rightBarItem = UIBarButtonItem()
        rightBarItem.customView = rightBarView


        navigationItem.leftBarButtonItem = leftBarItem
        navigationItem.rightBarButtonItem = rightBarItem
    }

    private func setupTabelView() {

        tableview = UITableView.init(frame: view.bounds, style: UITableViewStyle.Grouped)
        tableview?.delegate = self
        tableview?.dataSource = self
        tableview?.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableview?.backgroundColor = Color_GlobalBackground
        tableview?.sectionFooterHeight = 0
        tableview?.sectionHeaderHeight = 0
        view.addSubview(tableview!)

        tableview?.tableHeaderView = headerView

        tableview?.tableFooterView = footerView

    }


    //Mark - 懒加载
    private lazy var leftBarView: UIView = {

        let view = UIView.init(frame: CGRectMake(0, 0, 88, 44))

        return view

    }()

    private lazy var rightBarView: UIView = {

        let view = UIView.init(frame: CGRectMake(0, 0, 88, 44))

        return view
    }()

    /**
     TableView 的HeaderView
     */
    private lazy var headerView: MeHeaderView = {
        let headerView = MeHeaderView.init(frame: CGRectMake(0, 0, ScreenWidth, 217 + 70))

        return headerView
    }()


    private lazy var footerView: MeFooterView = {

        let footerView = MeFooterView.init(frame: CGRectMake(0, 0, ScreenWidth, 300))


        return footerView
    }()


    private lazy var secionView: UIView = {

        let nibs: NSArray = NSBundle.mainBundle().loadNibNamed("MeSectionView", owner: nil, options: nil)
        let view = nibs.lastObject as!UIView
        view.frame = CGRect.init(x: 0, y: 0, width: self.tableview!.bounds.width, height: 60)

        return view

    }()


    //Mark: - Action
    @objc private func mailBtnAction() {
        NSNotificationCenter.defaultCenter().postNotificationName(Notif_Login, object: nil)
    }


    @objc private func alarmclockBtnAction() {
        NSNotificationCenter.defaultCenter().postNotificationName(Notif_Login, object: nil)
    }

    @objc private func qrcodeBtnAction() {
        NSNotificationCenter.defaultCenter().postNotificationName(Notif_Login, object: nil)
    }

    @objc private func settingBtnAction() {

        NSNotificationCenter.defaultCenter().postNotificationName(Notif_Login, object: nil)
    }

}

extension MeViewController:UITableViewDataSource, UITableViewDelegate{


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 0
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath)
        cell.textLabel?.text = "test"
        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44.0
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        return secionView
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {

        /// 处理背景图片拉伸效果
        let offsetY = scrollView.contentOffset.y;
        if offsetY > 0 {

            return
        }
        let upFactor: CGFloat = 0.6;
        if offsetY >= 0.0 {
            headerView.bgimageView.transform = CGAffineTransformMakeTranslation(0, offsetY * upFactor)
        } else {
            let transform = CGAffineTransformMakeTranslation(0, offsetY)
            let s = 1 + -offsetY * 0.01
            headerView.bgimageView.transform = CGAffineTransformScale(transform, 1, s)
        }
    }
    
}
