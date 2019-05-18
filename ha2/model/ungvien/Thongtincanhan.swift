//
//  Thongtincanhan.swift
//  ha2
//
//  Created by vuminhtam on 5/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
class Thongtincanhan: Codable {
    var email : String?
    var linkAvatar : String?
    var hoso : Int?

    
    init(email: String, linkAvatar: String, hoso: Int) {
        self.email = email
        self.linkAvatar = linkAvatar
        self.hoso = hoso
    }
    
}
