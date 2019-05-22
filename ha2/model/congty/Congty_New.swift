//
//  Congty_New.swift
//  ha2
//
//  Created by vuminhtam on 5/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
struct Congty_New: Codable {
    var ID_Congty : String?
    var quanly_thongtintuyendung : [Quanly_Thongtintuyendung]?
    var quanly_hosoungtuyen : [Quanly_Hosoungtuyen]?
    var thongtincanhanCT : Thongtincanhan_CT?
    
    init(ID_Congty: String, quanly_thongtintuyendung: [Quanly_Thongtintuyendung], quanly_hosoungtuyen: [Quanly_Hosoungtuyen],thongtincanhanCT: Thongtincanhan_CT) {
        self.ID_Congty = ID_Congty
        self.quanly_thongtintuyendung = quanly_thongtintuyendung
        self.quanly_hosoungtuyen = quanly_hosoungtuyen
        self.thongtincanhanCT = thongtincanhanCT

    }
    
}
