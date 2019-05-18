//
//  User_1.swift
//  ha2
//
//  Created by vuminhtam on 5/17/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

struct User_1 {
    let id:String!
    let email:String!
    let linkAvatar:String!
    var Avatar:UIImage!
    var status_HS:Int
    init()
    {
        id = ""
        email = ""
        linkAvatar = ""
        Avatar = UIImage(named: "person")
        status_HS = 0
    }
    
    init(id:String,email:String,linkAvatar:String,status_HS:Int) {
        self.id = id
        self.email = email
        self.linkAvatar = linkAvatar
        self.Avatar = UIImage(named: "person")
        self.status_HS = status_HS
    }
    
}
