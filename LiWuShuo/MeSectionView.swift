//
//  MeSectionView.swift
//  LiWuShuo
//
//  Created by 房慧科技 on 16/8/2.
//  Copyright © 2016年 fanghuikeji. All rights reserved.
//

import UIKit

class MeSectionView: UIView {


    @IBOutlet weak var bottomLineView: UIView!

    @IBOutlet weak var bottonmLineViewLeading: NSLayoutConstraint!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    @IBAction func singleBtnAction(sender: AnyObject) {
        bottonmLineViewLeading.constant = 0
    }
    @IBAction func strategyBtnAction(sender: AnyObject) {
        bottonmLineViewLeading.constant = self.bounds.width * 0.5
        
    }
}
