////
////  get_Congty.swift
////  ha2
////
////  Created by vuminhtam on 5/21/19.
////  Copyright © 2019 Apple. All rights reserved.
////
//
//import Foundation
//import Firebase
//
//class get_Congty {
//    static var shared: get_Congty = get_Congty()
//    
//    func fetchData(tableName: DatabaseReference, currentUserId: String, completion: @escaping (_ result: UngVien_New, _ error: String) -> Void) {
//        tableName.observe(.childAdded) { (snapshot) in
//            if let postDict = snapshot.value as? [String:Any], currentUserId == snapshot.key {
//                // lay ra thong tin ca nhan
//                let thongtincanhan_CT: [String:Any] = postDict["Thongtincanhan"] as! [String:Any]
//                let canhan = Thongtincanhan_CT.init(email: thongtincanhan_CT["Email"] as! String, linkAvatar: thongtincanhan_CT["LinkAvatar"] as! String, diachi: thongtincanhan_CT["Diachi"] as! String, tenCT: thongtincanhan_CT["TenCT"] as! String, sdt: thongtincanhan_CT["SDT"] as! String)
//                
//                let get_thongtincanhan_CT: Thongtincanhan_CT = canhan
//                
//                // lay ra thong tin tuyen dung
//                let thongtintuyendung_CT: [String:Any] = postDict["Thongtintuyendung"] as! [String:Any]
//                 for item in thongtintuyendung_CT as! NSMutableDictionary {
//                    let TTTD = item.value as! [String:Any]
//                     chitiet.gia = TTTD["Luong"] as? String
//                }
//                let tuyendung = Thongtintuyendung_CT.init(luong: thongtintuyendung_CT["Luong"] as! String, motachung: thongtintuyendung_CT["Motachung"] as! String, nghanh: thongtintuyendung_CT["Nganh"] as! String, soluongHS: thongtintuyendung_CT["SoluongHS"] as! String, vitrituyen: thongtintuyendung_CT["Vitrituyen"] as! String)
//                
//                let get_thongtintuyendung_CT: Thongtintuyendung_CT = tuyendung
//                
//                // lay ra thong tin ho so ung vien
//                let thongtintuyendung_CT: [String:Any] = postDict["Hosoungtuyen"] as! [String:Any]
//                let tuyendung = Thongtintuyendung_CT.init(luong: thongtintuyendung_CT["Luong"] as! String, motachung: thongtintuyendung_CT["Motachung"] as! String, nghanh: thongtintuyendung_CT["Nganh"] as! String, soluongHS: thongtintuyendung_CT["SoluongHS"] as! String, vitrituyen: thongtintuyendung_CT["Vitrituyen"] as! String)
//                
//                let get_thongtintuyendung_CT: Thongtintuyendung_CT = tuyendung
//                
//                //                let newUser: NewUser = NewUser.init(userID: snapshot.key, Quanlydaytro: daytro, Quanlythongtincanhan: thongtincanhan)
//                //                daytro = []
//                //                completion(newUser,"")
//                let new_UngVien: UngVien_New = UngVien_New.init(userID: snapshot.key, Thongtincanhan: thongtincanhan, Thongtinlienhe: thongtinlienhe, Thongtintongquan: thongtintongquan)
//                completion(new_UngVien,"")
//                
//            }
//            else {
//                print("ERROR SNAPSHOT.VALUE")
//                
//                completion(UngVien_New.init(userID: "", Thongtincanhan: Thongtincanhan.init(email: "", linkAvatar: "", hoso: 0), Thongtinlienhe: Thongtinlienhe.init(email: "", gioitinh: "", honnhan: "", hoten: "", ngaysinh: "", sdt: "", thanhpho: "", diachi: ""), Thongtintongquan: Thongtintongquan.init(capbachientai: "", capbacmongmuon: "", diadiemmongmuon: "", hinhthuclamviec: "", mucluongtoithieu: "", nghanhnghemongmuon: "", sonamkinhnghiem: "", trinhdohocvan: "", vitrimongmuon: "")), "Error userModel = nil")
//                
//            }
//        }
//    }
//}
