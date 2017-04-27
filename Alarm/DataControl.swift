//
//  DataControl.swift
//  Alarm
//
//  Created by Siwat Charoensong on 4/18/2560 BE.
//  Copyright © 2560 Siwat Charoensong. All rights reserved.
//

import Foundation

class dataControl {
    
    private var _Subject:String!
    private var _TimeStart:String!
    private var _TimeEnd:String!
    private var _Room:String!
    
    var subject:String {
        return _Subject
    }
    var timeStart:String {
        return _TimeStart
    }
    var timeEnd:String {
        return _TimeEnd
    }
    var room:String {
        return _Room
    }
    
    init(subject:String ,timeStart:String, timeEnd:String, room:String) {
        self._Subject = subject
        self._Room = room
        self._TimeEnd = timeEnd
        self._TimeStart = timeStart
    }
    
}
