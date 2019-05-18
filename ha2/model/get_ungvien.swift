//
//  get_ungvien.swift
//  ha2
//
//  Created by vuminhtam on 5/18/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import Firebase

class get_ungvien {
    static var shared: get_ungvien = get_ungvien()
    
    func fetchData(tableName: DatabaseReference, currentUserId: String, completion: @escaping (_ result: UngVien_New, _ error: String) -> Void) {
        tableName.observe(.childAdded) { (snapshot) in
            if let postDict = snapshot.value as? [String:Any], currentUserId == snapshot.key {
                // lay ra thong tin ca nhan
                let thongtin: [String:Any] = postDict["Thongtincanhan"] as! [String:Any]
                let HS = thongtin["Hoso"] as! String
                let hs2 = Int(HS)
                
                let canhan = Thongtincanhan.init(email: thongtin["Email"] as! String, linkAvatar: thongtin["LinkAvatar"] as! String, hoso: hs2!)
                
                let thongtincanhan: Thongtincanhan = canhan
                
                // lay ra thong tin lien he
                let thongtinlH: [String:Any] = postDict["Thongtinlienhe"] as! [String:Any]
                
                let lienhe = Thongtinlienhe.init(email: thongtinlH["Email"] as! String, gioitinh: thongtinlH["Gioitinh"] as! String, honnhan: thongtinlH["Honnhan"] as! String, hoten: thongtinlH["Hoten"] as! String, ngaysinh: thongtinlH["Ngaysinh"] as! String, sdt: thongtinlH["SDT"] as! String, thanhpho: thongtinlH["Thanhpho"] as! String, diachi: thongtinlH["Điachi"] as! String)
                
                let thongtinlienhe: Thongtinlienhe = lienhe

                // lay ra thong tin tong quan
                let thongtintq: [String:Any] = postDict["Thongtintongquan"] as! [String:Any]
                
                let tongquan = Thongtintongquan.init(capbachientai: thongtintq["capbachientai"] as! String, capbacmongmuon: thongtintq["capbacmongmuon"] as! String, diadiemmongmuon: thongtintq["diadiemmongmuon"] as! String, hinhthuclamviec: thongtintq["hinhthuclamviec"] as! String, mucluongtoithieu: thongtintq["mucluongtoithieu"] as! String, nghanhnghemongmuon: thongtintq["nghanhnghemongmuon"] as! String, sonamkinhnghiem: thongtintq["sonamkinhnghiem"] as! String, trinhdohocvan: thongtintq["trinhdohocvan"] as! String, vitrimongmuon: thongtintq["vitrimongmuon"] as! String)
            
                
                let thongtintongquan: Thongtintongquan = tongquan
                
//                let newUser: NewUser = NewUser.init(userID: snapshot.key, Quanlydaytro: daytro, Quanlythongtincanhan: thongtincanhan)
//                daytro = []
//                completion(newUser,"")
                let new_UngVien: UngVien_New = UngVien_New.init(userID: snapshot.key, Thongtincanhan: thongtincanhan, Thongtinlienhe: thongtinlienhe, Thongtintongquan: thongtintongquan)
                completion(new_UngVien,"")
                
            }
            else {
                print("ERROR SNAPSHOT.VALUE")

                completion(UngVien_New.init(userID: "", Thongtincanhan: Thongtincanhan.init(email: "", linkAvatar: "", hoso: 0), Thongtinlienhe: Thongtinlienhe.init(email: "", gioitinh: "", honnhan: "", hoten: "", ngaysinh: "", sdt: "", thanhpho: "", diachi: ""), Thongtintongquan: Thongtintongquan.init(capbachientai: "", capbacmongmuon: "", diadiemmongmuon: "", hinhthuclamviec: "", mucluongtoithieu: "", nghanhnghemongmuon: "", sonamkinhnghiem: "", trinhdohocvan: "", vitrimongmuon: "")), "Error userModel = nil")

            }
        }
    }
}
