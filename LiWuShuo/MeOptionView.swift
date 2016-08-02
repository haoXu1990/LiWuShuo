//
//  MeOptionView.swift
//  LiWuShuo
//
//  Created by 房慧科技 on 16/8/2.
//  Copyright © 2016年 fanghuikeji. All rights reserved.
//

import UIKit

class MeOptionView: UIView {


    var btns = [UIButton]()

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

    private func setupUI() {

        backgroundColor = UIColor.whiteColor()
        addSubview(createBtn("shopcart_bt", title: "购物车"))
        addSubview(createBtn("order_bt", title: "订单"))
        addSubview(createBtn("discount_bt", title: "礼券"))
        addSubview(createBtn("costomer_bt", title: "客服"))
        addSubview(line)

    }


    private func setupUIFrame() {

        var i = 0

        let width = frame.width / 4
        let height = frame.height

        for btn in btns {

            btn.frame = CGRect.init(x: CGFloat(i) * width, y: 0, width: width, height: height)
            btn.tag = i
            i += 1
        }

    }


    private func createBtn(imageName: NSString, title: NSString) -> UIButton{

        let btn = ButtonTitleDown()
        btn.setTitle(title as String, forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.init(red: 60.0/255.0, green: 60.0/255.0, blue: 60.0/255.0, alpha: 1.0), forState: UIControlState.Normal)
        btn.titleLabel?.font = UIFont.systemFontOfSize(12)
        btn.setImage(UIImage.init(named: imageName as String), forState: UIControlState.Normal)
        btn.addTarget(self, action: #selector(MeOptionView.buttonAction(_:)), forControlEvents: UIControlEvents.TouchUpInside)

        //把创建的按钮添加到按钮数组
        btns.append(btn)

        return btn
    }

    // MARK: - 懒加载
    private lazy var line: UIView = {

        let line = UIView()
        line.backgroundColor = UIColor.init(red: 208.0/255, green: 208.0/255, blue: 208.0/255, alpha: 1.0)

        return line
    }()

    // MARK: - Action
    @objc private func buttonAction(button: UIButton){

        NSNotificationCenter.defaultCenter().postNotificationName(Notif_Login, object: nil)
    }
}
