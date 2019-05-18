//
//  Thongtinlienhe.swift
//  ha2
//
//  Created by vuminhtam on 5/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
class Thongtinlienhe: Codable {
    var email : String?
    var gioitinh: String?
    var honnhan : String?
    var hoten : String?
    var ngaysinh : String?
    var sdt : String?
    var thanhpho : String?
    var diachi : String?
    
    init(email: String, gioitinh: String, honnhan: String, hoten: String, ngaysinh: String,sdt: String, thanhpho: String,diachi: String) {
        self.email = email
        self.gioitinh = gioitinh
        self.honnhan = honnhan
        self.hoten = hoten
        self.ngaysinh = ngaysinh
        self.sdt = sdt
        self.thanhpho = thanhpho
        self.diachi = diachi
    }
    
}
