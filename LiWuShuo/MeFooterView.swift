//
//  MeFooterView.swift
//  LiWuShuo
//
//  Created by 房慧科技 on 16/8/2.
//  Copyright © 2016年 fanghuikeji. All rights reserved.
//

import UIKit

class MeFooterView: UIView {



    required init?(coder aDecoder: NSCoder) {

        fatalError("init(coder:) has not been implemented")
    }


    override init(frame: CGRect) {

        super.init(frame: frame)
        setupUI()
    }


    override func layoutSubviews() {
        super.layoutSubviews()
        setupUIFrame()
    }


    // Mark: - 初始化UI
    private func setupUI(){

        backgroundColor = UIColor.whiteColor()
        addSubview(icon)
        addSubview(tipLab)
        addSubview(loginBtn)
        loginBtn.addTarget(self, action: #selector(MeFooterView.loginBtnAction), forControlEvents: UIControlEvents.TouchUpInside)

    }

    private func setupUIFrame(){

        icon.snp_makeConstraints { (make) in

            make.top.equalTo(self).offset(80)
            make.centerX.equalTo(self.snp_centerX)
        }

        tipLab.snp_makeConstraints { (make) in
            make.top.equalTo(icon.snp_bottom).offset(10)
            make.centerX.equalTo(self.snp_centerX)
        }

        loginBtn.snp_makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
        }
    }

    // Mark: - 懒加载
    private var icon: UIImageView = {
        let icon = UIImageView.init(image: UIImage.init(named: "me_blank"))
        return icon

    }()

    private var tipLab: UILabel = {

        let tipLab = UILabel()
        tipLab.text = "登陆以享受更多功能"
        tipLab.textColor = UIColor.init(red: 180.0 / 255.0, green: 180.0 / 255.0, blue: 180.0/255.0, alpha: 1.0)
        tipLab.font = UIFont.systemFontOfSize(16)
        tipLab.textAlignment = NSTextAlignment.Center

        return tipLab
    }()

    private var loginBtn: UIButton = {

        let btn = UIButton()
        btn.backgroundColor = UIColor.clearColor()

        return btn
    }()


    // MARK: - Action
    @objc private func loginBtnAction(){

        NSNotificationCenter.defaultCenter().postNotificationName(Notif_Login, object: nil)
    }
}
