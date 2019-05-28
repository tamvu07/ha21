//
//  get_Congty.swift
//  ha2
//
//  Created by vuminhtam on 5/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import Firebase

class get_Congty {
    static var shared: get_Congty = get_Congty()

    func fetchData(tableName: DatabaseReference, currentUserId: String, completion: @escaping (_ result: Congty_New, _ error: String) -> Void) {
        tableName.observe(.childAdded) { (snapshot) in
            if let postDict = snapshot.value as? [String:Any], currentUserId == snapshot.key {
                // lay ra thong tin ca nhan
                let thongtincanhan_CT: [String:Any] = postDict["Thongtincanhan"] as! [String:Any]
                let canhan = Thongtincanhan_CT.init(email: thongtincanhan_CT["Email"] as! String, linkAvatar: thongtincanhan_CT["LinkAvatar"] as! String, diachi: thongtincanhan_CT["Diachi"] as! String, tenCT: thongtincanhan_CT["TenCT"] as! String, sdt: thongtincanhan_CT["SDT"] as! String)

                let get_thongtincanhan_CT: Thongtincanhan_CT = canhan

                // lay ra thong tin tuyen dung
                 var QL_TTTD: [Quanly_Thongtintuyendung] = []
                var ThongtinTD: Thongtintuyendung_CT = Thongtintuyendung_CT.init(luong: "", motachung: "", nghanh: "", soluongHS: "", vitrituyen: "")
                if(postDict["Thongtintuyendung"] != nil)
                {
                    let thongtintuyendung_CT: [String:Any] = postDict["Thongtintuyendung"] as! [String:Any]
                    var dem = 0
                    for item in thongtintuyendung_CT as! [String:Any] {
                        if let data: [String:Any] = item.value as? [String:Any]
                        {
                            ThongtinTD.luong = data["Luong"] as? String
                            ThongtinTD.motachung = data["Motachung"] as? String
                            ThongtinTD.nghanh = data["Nganh"] as? String
                            ThongtinTD.soluongHS = data["SoluongHS"] as? String
                            ThongtinTD.vitrituyen = data["Vitrituyen"] as? String
                            QL_TTTD.append(Quanly_Thongtintuyendung.init(id_TTTD: item.key as! String, QL_thongtinTD: [ThongtinTD] ))

                            dem = dem + 1
                        }else{
//                            QL_TTTD.append(Quanly_Thongtintuyendung.init(id_TTTD: item.key as! String, QL_thongtinTD: ThongtinTD))
                        }
                        
                    }
                }

                // lay ra thong tin ho so ung vien
                var QL_TTHSUT: [Quanly_Hosoungtuyen] = []
                var HSUT: Thongtin_Hosoungtuyen = Thongtin_Hosoungtuyen.init(id: "", nghanh: "", vitrituyen: "")
                // lay thong tin Ho so ung tuyen
                if(postDict["Hosoungtuyen"] != nil)
                {
                    let thongtin_Hosoungtuyen: [String:Any] = postDict["Hosoungtuyen"] as! [String:Any]
                    for item in thongtin_Hosoungtuyen as! [String:Any] {
                        if let data: [String:Any] = item.value as? [String:Any]
                        {
                            HSUT.id = data["ID_Hoso_Ungven"] as! String
                            HSUT.nghanh = data["Nganh"] as! String
                            HSUT.vitrituyen = data["Vitrituyen"] as! String
                            
                            QL_TTHSUT.append(Quanly_Hosoungtuyen.init(id_HSUT: item.key as! String, QL_Hosoungtuyen: HSUT))
                        }else{
//                            QL_TTHSUT.append(Quanly_Hosoungtuyen.init(id_HSUT: item.key as! String, QL_Hosoungtuyen: HSUT))
                        }
                        
                    }
                }


                let new_Congty: Congty_New = Congty_New.init(ID_Congty: snapshot.key, quanly_thongtintuyendung: QL_TTTD, quanly_hosoungtuyen: QL_TTHSUT, thongtincanhanCT: get_thongtincanhan_CT)
                     completion(new_Congty,"")
            }
            else {
                print("ERROR SNAPSHOT.VALUE")
                completion(Congty_New.init(ID_Congty: "", quanly_thongtintuyendung: [], quanly_hosoungtuyen: [], thongtincanhanCT: Thongtincanhan_CT.init(email: "", linkAvatar: "", diachi: "", tenCT: "", sdt: "")), "Error userModel = nil")
                
            }
        }
    }
}
