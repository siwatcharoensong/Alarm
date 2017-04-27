//
//  SubjectView.swift
//  Alarm
//
//  Created by Siwat Charoensong on 4/15/2560 BE.
//  Copyright © 2560 Siwat Charoensong. All rights reserved.
//

import UIKit

class SubjectView: UIView {

    override func awakeFromNib() {
        layer.cornerRadius = 5
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize.init(width: 1.5, height: 1.5)
        layer.masksToBounds = false
    }
}
