//
//  Thongtintuyendung.swift
//  ha2
//
//  Created by vuminhtam on 5/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
class Thongtintuyendung_CT: Codable {
    var luong : String?
    var motachung : String?
    var nghanh :String?
    var soluongHS :String?
    var vitrituyen :String?
    
    
    init(luong: String, motachung: String, nghanh:String, soluongHS:String, vitrituyen:String) {
        self.luong = luong
        self.motachung = motachung
        self.nghanh = nghanh
        self.soluongHS = soluongHS
        self.vitrituyen = vitrituyen
    }
    
}
