//
//  MeHeaderView.swift
//  LiWuShuo
//
//  Created by 房慧科技 on 16/8/2.
//  Copyright © 2016年 fanghuikeji. All rights reserved.
//

import UIKit

class MeHeaderView: UIView {


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func layoutSubviews() {
        super.layoutSubviews()
        setupUIFrame()

    }

    // 初始化UI
    private func setupUI(){

        backgroundColor = UIColor.yellowColor()

        addSubview(bgimageView)
        addSubview(loginBtn)
        addSubview(nickLab)
        addSubview(meOptionView)

        loginBtn.addTarget(self, action: #selector(MeHeaderView.loginBtnAction), forControlEvents: UIControlEvents.TouchUpInside)
    }

    private func setupUIFrame(){

        loginBtn.snp_makeConstraints { (make) in
            make.top.equalTo(90.0)
            make.left.equalTo((ScreenWidth - loginBtn.bounds.width) * 0.5)
        }

        nickLab.snp_makeConstraints { (make) in
            make.top.equalTo(loginBtn.snp_bottom).offset(5.0)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }


        meOptionView.snp_makeConstraints { (make) in
            make.left.equalTo(0)
            make.bottom.equalTo(0)
            make.width.equalTo(self.snp_width)
            make.height.equalTo(70.0)
        }
    }



    //Mark -  懒加载
    lazy var bgimageView: UIImageView = {

        let imageView = UIImageView.init(image: UIImage.init(named: "me_profilebackground"))

        return imageView
    }()

    private lazy var loginBtn: UIButton = {

        let btn = UIButton()
        btn.setImage(UIImage.init(named: "me_avatar_boy"), forState: UIControlState.Normal)
        btn.sizeToFit()
        return btn
    }()

    private lazy var nickLab: UILabel = {

        let lab = UILabel()
        lab.text = "登陆"
        lab.textColor = UIColor.whiteColor()
        lab.font = UIFont.systemFontOfSize(14)
        lab.textAlignment = NSTextAlignment.Center
        lab.sizeToFit()

        return lab
    }()


    private lazy var meOptionView: UIView = {

        let meOptionView = MeOptionView()

        return meOptionView

    }()


    //Mark -  Action

    @objc private func loginBtnAction() {
        NSNotificationCenter.defaultCenter().postNotificationName(Notif_Login, object: nil)
    }

}


