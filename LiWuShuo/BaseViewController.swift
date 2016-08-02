//
//  BaseViewController.swift
//  LiWuShuo
//
//  Created by 房慧科技 on 16/8/2.
//  Copyright © 2016年 fanghuikeji. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(BaseViewController.login), name: Notif_Login, object: nil)
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)

        NSNotificationCenter.defaultCenter().removeObserver(self, name: Notif_Login, object: nil)
    }


    @objc private func login() {
        let sb = UIStoryboard(name: "LoginViewController", bundle: nil)
        let login = sb.instantiateInitialViewController()!
        presentViewController(login, animated: true, completion: nil)
    }
}
