//
//  TabBarController.swift
//  LiWuShuo
//
//  Created by 房慧科技 on 16/8/1.
//  Copyright © 2016年 fanghuikeji. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //添加子控制器
        addChildViewControllers()

    }

    private func addChildViewControllers(){

        addChildViewController(HomeViewController(), title: "礼物说", imageName: "tabbar_home")
        addChildViewController(HotViewController(), title: "热门", imageName: "tabbar_gift")
        addChildViewController(ClassifyViewController(), title: "分类", imageName: "tabbar_category")
        addChildViewController(MeViewController(), title: "我", imageName: "tabbar_me")

    }


    private func addChildViewController(controller:UIViewController, title:String, imageName:String){


        controller.tabBarItem.image = UIImage(named: imageName);
        controller.tabBarItem.selectedImage = UIImage(named: imageName + "_selected");
        controller.tabBarItem.title = title;

        let nav = NavigationController()

        nav.addChildViewController(controller)
        addChildViewController(nav)
    }

}
