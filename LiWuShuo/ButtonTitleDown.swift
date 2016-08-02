//
//  ButtonTitleDown.swift
//  LiWuShuo
//
//  Created by 房慧科技 on 16/8/2.
//  Copyright © 2016年 fanghuikeji. All rights reserved.
//

import UIKit

class ButtonTitleDown: UIButton {


    override func layoutSubviews() {

        super.layoutSubviews()

        let margin: CGFloat = 2.0
        let height = frame.size.height
        let width = frame.size.width

        let imageH = imageView!.frame.size.height
        let imageW = imageView!.frame.size.width
        let titleH = titleLabel!.frame.size.height
        let titleW = titleLabel!.frame.size.width

        let contentMargin = (height - imageH - titleH - margin) * 0.5

        imageView!.frame.origin.y = contentMargin
        imageView!.frame.origin.x = (width - imageW) * 0.5
        titleLabel!.frame.origin.y = (CGRectGetMaxY(imageView!.frame) + margin)
        titleLabel!.frame.origin.x = (width - titleW) * 0.5

    }

}
