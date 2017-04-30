//
//  DataControl.swift
//  Alarm
//
//  Created by Siwat Charoensong on 4/18/2560 BE.
//  Copyright © 2560 Siwat Charoensong. All rights reserved.
//

import Foundation
import Firebase

class dataControl {
    
    private var _Subject:String!
    private var _TimeStart:String!
    private var _TimeEnd:String!
    private var _Room:Int!
    private var _majorKey:String!
    private var _Day:String!
    
    var subject:String {
        return _Subject
    }
    var timeStart:String {
        return _TimeStart
    }
    var timeEnd:String {
        return _TimeEnd
    }
    var room:Int {
        return _Room
    }
    var majorKey:String{
        return _majorKey
    }
    var day:String{
        return _Day
    }
    
    init(subject:String ,timeStart:String, timeEnd:String, room:Int, day:String) {
        self._Day = day
        self._Subject = subject
        self._Room = room
        self._TimeEnd = timeEnd
        self._TimeStart = timeStart
    }
    
    init(majorKey:String ,dictionary: Dictionary <String,AnyObject>) {
        self._majorKey = majorKey
        
        self._Day = dictionary["day"] as! String
        self._Room = dictionary["room"] as! Int
        self._TimeStart = dictionary["start"] as! String
        self._TimeEnd = dictionary["end"] as! String
        self._Subject = dictionary["subject"] as! String
    }
    
}
