//
//  get_nghe_nghanh_idCT.swift
//  ha2
//
//  Created by vuminhtam on 5/22/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
class get_nghe_nghanh_idCT: Codable {
    var id_CT : String?
    var nghanh : String?
    var nghe : String?
    
    init(id_CT: String,nghe: String, nghanh: String) {
        self.id_CT = id_CT
        self.nghanh = nghanh
        self.nghe = nghe
    }
}

