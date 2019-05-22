//
//  QL_nhung_nghanh_CT.swift
//  ha2
//
//  Created by vuminhtam on 5/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
class QL_nhung_nghanh_CT : Codable {
    var id_CT : String?
    var mang_TTTD : [Quanly_Thongtintuyendung]?
    var mang_TTCN : Thongtincanhan_CT?
    
    init(id_CT: String, mang_TTTD: [Quanly_Thongtintuyendung], mang_TTCN: Thongtincanhan_CT) {
        self.id_CT = id_CT
        self.mang_TTTD = mang_TTTD
        self.mang_TTCN = mang_TTCN
    }
}
