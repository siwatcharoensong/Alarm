//
//  CurrentDate.swift
//  Alarm
//
//  Created by Siwat Charoensong on 4/15/2560 BE.
//  Copyright © 2560 Siwat Charoensong. All rights reserved.
//

import UIKit

class CurrentDate: UILabel {

    override func awakeFromNib() {
        let date = Date()
        let formatterDate = DateFormatter()
        formatterDate.dateStyle = .full
        self.text = formatterDate.string(from: date)
    }
}
