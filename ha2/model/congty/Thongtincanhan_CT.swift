//
//  Thongtincanhan_CT.swift
//  ha2
//
//  Created by vuminhtam on 5/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
class Thongtincanhan_CT: Codable {
    var email : String?
    var linkAvatar : String?
    var diachi :String?
    var tenCT :String?
    var sdt :String?
    
    
    init(email: String, linkAvatar: String, diachi:String, tenCT:String, sdt:String) {
        self.email = email
        self.linkAvatar = linkAvatar
        self.diachi = diachi
        self.tenCT = tenCT
        self.sdt = sdt
    }
    
}
