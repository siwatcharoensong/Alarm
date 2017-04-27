//
//  SubjectTableViewCell.swift
//  Alarm
//
//  Created by Siwat Charoensong on 4/14/2560 BE.
//  Copyright © 2560 Siwat Charoensong. All rights reserved.
//

import UIKit

class SubjectTableViewCell: UITableViewCell {
    
    @IBOutlet weak var startTimeLbl:UILabel!
    @IBOutlet weak var endTimeLbl:UILabel!
    @IBOutlet weak var subjectLbl:UILabel!
    @IBOutlet weak var roomLbl:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    func dataSetSubject (dataControl:dataControl)
    {
        startTimeLbl.text = dataControl.timeStart
        endTimeLbl.text = dataControl.timeEnd
        subjectLbl.text = dataControl.subject
        roomLbl.text = dataControl.room
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
