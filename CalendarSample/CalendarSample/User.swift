//
//  User.swift
//  CalendarSample
//
//  Created by 岡崎大地 on 2018/10/19.
//  Copyright © 2018年 daichi okazaki. All rights reserved.
//

import RealmSwift

class Event: Object {
    
    @objc dynamic var date: String = ""
    @objc dynamic var event: String = ""
}
