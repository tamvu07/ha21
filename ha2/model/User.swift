//
//  User.swift
//  ha2
//
//  Created by vuminhtam on 4/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import UIKit

struct User {
    let id:String!
    let email:String!
    let linkAvatar:String!
    var Avatar:UIImage!
    let diachi:String!
    let sdt:String!
    let tenCT:String!
    
    init()
    {
        id = ""
        email = ""
        linkAvatar = ""
        Avatar = UIImage(named: "person")
        diachi = ""
        sdt = ""
        tenCT = ""
    }
    
    init(id:String,email:String,linkAvatar:String, diachi:String, sdt:String, tenCT:String) {
        self.id = id
        self.email = email
        self.linkAvatar = linkAvatar
        self.Avatar = UIImage(named: "person")
        self.diachi = diachi
        self.sdt = sdt
        self.tenCT = tenCT
    }
    
}
