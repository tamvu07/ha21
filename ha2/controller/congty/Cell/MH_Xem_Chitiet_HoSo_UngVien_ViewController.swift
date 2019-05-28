//
//  MH_Xem_Chitiet_HoSo_UngVien_ViewController.swift
//  ha2
//
//  Created by vuminhtam on 5/28/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class MH_Xem_Chitiet_HoSo_UngVien_ViewController: UIViewController {

    @IBOutlet weak var txt_ten: UILabel!
    @IBOutlet weak var txt_ngaysinh: UILabel!
    @IBOutlet weak var txt_gioitinh: UILabel!
    @IBOutlet weak var txt_honnhan: UILabel!
    @IBOutlet weak var txt_email: UILabel!
    @IBOutlet weak var txt_diachi: UILabel!
    @IBOutlet weak var txt_sdt: UILabel!
    
    @IBOutlet weak var txt_vitrimongmuon: UILabel!
    @IBOutlet weak var txt_capbachientai: UILabel!
    @IBOutlet weak var txt_capbacmongmuon: UILabel!
    
    
    var currentUser: UngVien_New = UngVien_New.init(userID: "", Thongtincanhan: Thongtincanhan.init(email: currentUser_1.email, linkAvatar: currentUser_1.linkAvatar, hoso: currentUser_1.status_HS), Thongtinlienhe: Thongtinlienhe.init(email: "", gioitinh: "", honnhan: "", hoten: "", ngaysinh: "", sdt: "", thanhpho: "", diachi: ""), Thongtintongquan: Thongtintongquan.init(capbachientai: "", capbacmongmuon: "", diadiemmongmuon: "", hinhthuclamviec: "", mucluongtoithieu: "", nghanhnghemongmuon: "", sonamkinhnghiem: "", trinhdohocvan: "", vitrimongmuon: ""))
    override func viewDidLoad() {
        super.viewDidLoad()

        
        ////
        get_ungvien.shared.fetchData(tableName: ref.child("Nguoidung/Ungvien"), currentUserId: currentUser_1.id) { (UngVien_New, err) in
            if err != "" {
                print(err)
            }
            else {
                self.currentUser = UngVien_New
                self.txt_1.text = self.currentUser.Thongtintongquan?.vitrimongmuon
                self.txt_2.text = self.currentUser.Thongtintongquan?.capbachientai
                self.txt_3.text = self.currentUser.Thongtintongquan?.capbacmongmuon
                self.txt_4.text = self.currentUser.Thongtintongquan?.nghanhnghemongmuon
                self.txt_5.text = self.currentUser.Thongtintongquan?.diadiemmongmuon
                self.txt_6.text = self.currentUser.Thongtintongquan?.trinhdohocvan
                self.txt_7.text = self.currentUser.Thongtintongquan?.sonamkinhnghiem
                self.txt_8.text = self.currentUser.Thongtintongquan?.hinhthuclamviec
                self.txt_9.text = self.currentUser.Thongtintongquan?.mucluongtoithieu
            }
        }
        /////
    }
    



}
