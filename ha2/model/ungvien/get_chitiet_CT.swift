//
//  get_chitiet_CT.swift
//  ha2
//
//  Created by vuminhtam on 5/23/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
class get_chitiet_CT: Codable {
    let linkAvatar: String?
//    var Avatar: UIImage?
    let ten: String?
    let id_CT : String?
    let nghanh : String?
    let nghe : String?
    let luong: String?
    let motacongviec: String?
    let email: String?
    let sdt: String?
    let diachi: String
    
    init(id_CT: String,ten: String,linkAvatar: String,nghe: String, nghanh: String,luong: String, motacongviec: String, email: String, sdt: String, diachi: String) {
        self.id_CT = id_CT
        self.nghanh = nghanh
        self.nghe = nghe
        self.luong = luong
        self.motacongviec = motacongviec
        self.email = email
        self.sdt = sdt
        self.linkAvatar = linkAvatar
        self.ten = ten
        self.diachi = diachi
//        self.Avatar = UIImage(named: "person")
    }
}


