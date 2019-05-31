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
    @IBOutlet weak var txt_trinhdocaonhat: UILabel!
    @IBOutlet weak var diadiemmongmuon: UILabel!
    @IBOutlet weak var txt_mucluongtoithieu: UILabel!
    @IBOutlet weak var txt_hinhthuclamviec: UILabel!
    @IBOutlet weak var txt_nghenghiepmongmuon: UILabel!
    
    
    var currentUser: UngVien_New = UngVien_New.init(userID: "", Thongtincanhan: Thongtincanhan.init(email: "", linkAvatar: "", hoso: 0), Thongtinlienhe: Thongtinlienhe.init(email: "", gioitinh: "", honnhan: "", hoten: "", ngaysinh: "", sdt: "", thanhpho: "", diachi: ""), Thongtintongquan: Thongtintongquan.init(capbachientai: "", capbacmongmuon: "", diadiemmongmuon: "", hinhthuclamviec: "", mucluongtoithieu: "", nghanhnghemongmuon: "", sonamkinhnghiem: "", trinhdohocvan: "", vitrimongmuon: ""))
    override func viewDidLoad() {
        super.viewDidLoad()

        
        ////
        get_ungvien.shared.fetchData(tableName: ref.child("Nguoidung/Ungvien"), currentUserId: visitor_HSUV.id) { (UngVien_New, err) in
            if err != "" {
                print(err)
            }
            else {
                self.currentUser = UngVien_New
                self.txt_ten.text = self.currentUser.Thongtinlienhe?.hoten
                self.txt_ngaysinh.text = self.currentUser.Thongtinlienhe?.ngaysinh
                self.txt_gioitinh.text = self.currentUser.Thongtinlienhe?.gioitinh
                self.txt_honnhan.text = self.currentUser.Thongtinlienhe?.honnhan
                self.txt_email.text = self.currentUser.Thongtinlienhe?.email
                self.txt_diachi.text = self.currentUser.Thongtinlienhe?.diachi
                self.txt_sdt.text = self.currentUser.Thongtinlienhe?.sdt
                
                self.txt_vitrimongmuon.text = self.currentUser.Thongtintongquan?.vitrimongmuon
                self.txt_capbachientai.text = self.currentUser.Thongtintongquan?.capbachientai
                self.txt_capbacmongmuon.text = self.currentUser.Thongtintongquan?.capbacmongmuon
                self.txt_trinhdocaonhat.text = self.currentUser.Thongtintongquan?.trinhdohocvan
                self.diadiemmongmuon.text = self.currentUser.Thongtintongquan?.diadiemmongmuon
                self.txt_mucluongtoithieu.text = self.currentUser.Thongtintongquan?.mucluongtoithieu
                self.txt_hinhthuclamviec.text = self.currentUser.Thongtintongquan?.hinhthuclamviec
                self.txt_nghenghiepmongmuon.text = self.currentUser.Thongtintongquan?.nghanhnghemongmuon
            }
        }
        /////
    }
    



}
