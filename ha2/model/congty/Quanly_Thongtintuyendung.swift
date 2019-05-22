//
//  Quanly_Thongtintuyendung.swift
//  ha2
//
//  Created by vuminhtam on 5/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
class Quanly_Thongtintuyendung : Codable {
    var id_TTTD : String?
    var QL_thongtinTD : Thongtintuyendung_CT?
    
    init(id_TTTD: String, QL_thongtinTD: Thongtintuyendung_CT) {
        self.id_TTTD = id_TTTD
        self.QL_thongtinTD = QL_thongtinTD
    }
}
