//
//  UngVien_New.swift
//  ha2
//
//  Created by vuminhtam on 5/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
struct UngVien_New: Codable {
    var userID : String?
    var Thongtincanhan : Thongtincanhan?
    var Thongtinlienhe : Thongtinlienhe?
    var Thongtintongquan : Thongtintongquan?
    
    init(userID: String, Thongtincanhan: Thongtincanhan,Thongtinlienhe: Thongtinlienhe, Thongtintongquan:Thongtintongquan) {
        self.userID = userID
        self.Thongtincanhan = Thongtincanhan
        self.Thongtinlienhe = Thongtinlienhe
        self.Thongtintongquan = Thongtintongquan
    }
    
}
