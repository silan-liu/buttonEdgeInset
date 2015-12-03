//
//  Button+ImagePosition.swift
//  ButtonEdgeInsets
//
//  Created by liusilan on 15/12/2.
//  Copyright © 2015年 YY Inc. All rights reserved.
//

import Foundation
import UIKit

enum ButtonImagePosition: Int {
    case ButtonImageLeft = 0
    case ButtonImageRight
    case ButtonImageTop
    case ButtonImageBottom
}

extension UIButton {
    func updateButtonImagePostion(position: ButtonImagePosition, space: CGFloat) {
        var labelWidth = CGRectGetWidth(self.titleLabel!.frame)
        var labelHeight = CGRectGetHeight(self.titleLabel!.frame)

        // 获取到的width有可能为0，重新计算
        if labelWidth == 0 {
            if let text = self.titleLabel?.text {
                let size: CGSize = text.boundingRectWithSize(CGSizeZero, options: NSStringDrawingOptions.UsesFontLeading, attributes: [NSFontAttributeName:self.titleLabel!.font], context: nil).size;

                labelWidth = size.width
                labelHeight = size.height
            }
        }

        let imageViewFrame = self.imageView!.frame
        var titleLabelFrame = self.titleLabel!.frame
        titleLabelFrame.size = CGSizeMake(labelWidth, labelHeight)

        let imageViewWidth = CGRectGetWidth(imageViewFrame)
        let imageViewHeight = CGRectGetHeight(imageViewFrame)

        // imageView EdgeInset
        var imageViewLeft: CGFloat = 0
        var imageViewRight: CGFloat = 0
        var imageViewTop: CGFloat = 0
        var imageViewBottom: CGFloat = 0

        // titleLabel EdgeInset
        var titleLabelLeft: CGFloat = 0
        var titleLabelRight: CGFloat = 0
        var titleLabelTop: CGFloat = 0
        var titleLabelBottom: CGFloat = 0

        switch position {
        case ButtonImagePosition.ButtonImageLeft:
            imageViewLeft = 0 - space / 2
            imageViewTop = 0

            titleLabelLeft = space / 2
            titleLabelTop = 0

        case ButtonImagePosition.ButtonImageRight:
            imageViewTop = 0
            imageViewLeft = labelWidth + space / 2

            titleLabelTop = 0
            titleLabelLeft = -imageViewWidth - space / 2

        case ButtonImagePosition.ButtonImageTop:
            //imageViewTop = (buttonHeight - (labelHeight + imageViewHeight)) / 2 - (buttonHeight - imageViewHeight) / 2 - space / 2
            imageViewTop = -labelHeight / 2 - space / 2

            //imageViewLeft = (buttonWidth - imageViewWidth) / 2 - (buttonWidth - (labelWidth + imageViewWidth) / 2)
            imageViewLeft = labelWidth / 2

            titleLabelTop = imageViewHeight / 2 + space / 2
            titleLabelLeft = -imageViewWidth / 2

        case ButtonImagePosition.ButtonImageBottom:
            imageViewTop = labelHeight / 2 + space / 2
            imageViewLeft = labelWidth / 2

            titleLabelTop = -imageViewHeight / 2 - space / 2
            titleLabelLeft = -imageViewWidth / 2
        }

        imageViewBottom = -imageViewTop
        imageViewRight = -imageViewLeft

        titleLabelRight = -titleLabelLeft
        titleLabelBottom = -titleLabelTop

        // update inset
        self.imageEdgeInsets = UIEdgeInsetsMake(imageViewTop, imageViewLeft, imageViewBottom, imageViewRight)
        self.titleEdgeInsets = UIEdgeInsetsMake(titleLabelTop, titleLabelLeft, titleLabelBottom, titleLabelRight)

    }
}