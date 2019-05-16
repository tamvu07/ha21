//
//  CongTy.swift
//  ha2
//
//  Created by vuminhtam on 4/13/19.
//  Copyright © 2019 Apple. All rights reserved.
//
import Foundation
import UIKit

struct CongTy {
    let idCT:String!
    let tencongty:String!
    let congviec:String!
    let diachi:String!
    var avatar:String!
    let luong:String!
    let motacongviec:String!
    let email:String!
    let sdt:String!
    
    init()
    {
        idCT = ""
        tencongty = ""
        congviec = ""
        diachi = ""
        avatar = ""
        luong = ""
        motacongviec = ""
        email = ""
        sdt = ""
    }
    
    init(idCT:String,tencongty:String,congviec:String,diachi:String,avatar:String, luong:String, motacongviec:String,email:String,sdt:String) {
        self.idCT = idCT
        self.tencongty = tencongty
        self.congviec = congviec
        self.diachi = diachi
        self.avatar = avatar
        self.luong = luong
        self.motacongviec = motacongviec
        self.email = email
        self.sdt = sdt
    }
    
}
