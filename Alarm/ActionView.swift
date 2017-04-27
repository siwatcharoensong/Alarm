//
//  ActionView.swift
//  Alarm
//
//  Created by Siwat Charoensong on 4/15/2560 BE.
//  Copyright © 2560 Siwat Charoensong. All rights reserved.
//

import UIKit

class ActionView: UIView {

    override func awakeFromNib() {
        let rectShape = CAShapeLayer()
        rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft ,.topLeft], cornerRadii: CGSize(width: 5, height: 5)).cgPath
        
        self.layer.mask = rectShape
    }

}
