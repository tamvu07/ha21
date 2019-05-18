//
//  Thongtintongquan.swift
//  ha2
//
//  Created by vuminhtam on 5/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
class Thongtintongquan: Codable {
    var capbachientai : String?
    var capbacmongmuon: String?
    var diadiemmongmuon : String?
    var hinhthuclamviec : String?
    var mucluongtoithieu : String?
    var nghanhnghemongmuon : String?
    var sonamkinhnghiem : String?
    var trinhdohocvan : String?
    var vitrimongmuon : String?
    
    init(capbachientai: String, capbacmongmuon: String, diadiemmongmuon: String, hinhthuclamviec: String, mucluongtoithieu: String,nghanhnghemongmuon: String, sonamkinhnghiem: String,trinhdohocvan: String,vitrimongmuon: String) {
        self.capbachientai = capbachientai
        self.capbacmongmuon = capbacmongmuon
        self.diadiemmongmuon = diadiemmongmuon
        self.hinhthuclamviec = hinhthuclamviec
        self.mucluongtoithieu = mucluongtoithieu
        self.nghanhnghemongmuon = nghanhnghemongmuon
        self.sonamkinhnghiem = sonamkinhnghiem
        self.trinhdohocvan = trinhdohocvan
        self.vitrimongmuon = vitrimongmuon
    }
    
}
