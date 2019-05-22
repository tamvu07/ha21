//
//  Quanly_Hosoungtuyen.swift
//  ha2
//
//  Created by vuminhtam on 5/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

class Quanly_Hosoungtuyen : Codable {
    var id_HSUT : String?
    var QL_Hosoungtuyen : Thongtin_Hosoungtuyen?

    init(id_HSUT: String, QL_Hosoungtuyen: Thongtin_Hosoungtuyen) {
        self.id_HSUT = id_HSUT
        self.QL_Hosoungtuyen = QL_Hosoungtuyen
    }
}
