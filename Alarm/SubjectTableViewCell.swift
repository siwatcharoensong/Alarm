//
//  SubjectTableViewCell.swift
//  Alarm
//
//  Created by Siwat Charoensong on 4/14/2560 BE.
//  Copyright © 2560 Siwat Charoensong. All rights reserved.
//

import UIKit

class SubjectTableViewCell: UITableViewCell {
    
    @IBOutlet weak var subjectView:UIView!
    @IBOutlet weak var actionView:UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        subjectView.layer.cornerRadius = 5
        subjectView.layer.shadowColor = UIColor.lightGray.cgColor
        subjectView.layer.shadowOpacity = 0.5
        subjectView.layer.shadowRadius = 5.0
        subjectView.layer.shadowOffset = CGSize.init(width: 1.5, height: 1.5)
        subjectView.layer.masksToBounds = false
        
        
        let rectShape = CAShapeLayer()
        rectShape.path = UIBezierPath(roundedRect: self.actionView.bounds, byRoundingCorners: [.bottomLeft ,.topLeft], cornerRadii: CGSize(width: 5, height: 5)).cgPath
        
        self.actionView.layer.mask = rectShape
    }
    
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
