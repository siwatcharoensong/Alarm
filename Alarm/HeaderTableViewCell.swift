//
//  HeaderTableViewCell.swift
//  Alarm
//
//  Created by Siwat Charoensong on 4/13/2560 BE.
//  Copyright © 2560 Siwat Charoensong. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var signOutBtn:UIButton!
        
    @IBOutlet weak var dateCurrent:UILabel!
    
    func currentDateTime (){
        let date = Date()
        
        let formatterDate = DateFormatter()
        formatterDate.dateStyle = .full
        
        dateCurrent.text =  formatterDate.string(from: date)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}
