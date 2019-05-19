//
//  MH_XemTruocHoSo_ViewController.swift
//  ha2
//
//  Created by vuminhtam on 5/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class MH_XemTruocHoSo_ViewController: UIViewController {

    
    @IBOutlet weak var lb_hoten: UILabel!
    @IBOutlet weak var lb_ngaysinh: UILabel!
    @IBOutlet weak var lb_gioitinh: UILabel!
    @IBOutlet weak var lb_honnhan: UILabel!
    @IBOutlet weak var lb_email: UILabel!
    @IBOutlet weak var lb_diachi: UILabel!
    @IBOutlet weak var lb_sdt: UILabel!
    @IBOutlet weak var lb_nhanvien: UILabel!
    @IBOutlet weak var lb_capbachientai: UILabel!
    @IBOutlet weak var lb_capbacmongmuon: UILabel!
    @IBOutlet weak var lb_TDCnhat: UILabel!
    @IBOutlet weak var lb_diadiemMM: UILabel!
    @IBOutlet weak var lb_luongtoithieu: UILabel!
    @IBOutlet weak var lb_hinhthucLV: UILabel!
    @IBOutlet weak var lb_nganhngheMM: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var tablename = ref.child("Nguoidung").child("Ungvien")
        // Listen for new comments in the Firebase database
        tablename.observe(.childAdded, with: { (snapshot) in
            // nếu lấy được dữ liệu postDict từ sever về và id của user có trong postDict
            print(".......user hien tai la :\(currentUser_1.id).....spost la 1:\(snapshot.key)...\n")
            if let postDict = snapshot.value as? [String : AnyObject], currentUser_1.id == snapshot.key
            {
//                print(".......user hien tai la :\(currenUser.id).......spost la 2: \(snapshot.key).....\n")
                // lay thong tin ve cho thong tin lien he
                let User_current = (postDict["Thongtinlienhe"]) as! NSMutableDictionary
                let email:String = (User_current["Email"])! as? String ?? "000@gmail.com"
                let gioitinh:String = (User_current["Gioitinh"])! as? String ?? "000"
                let honnhan:String = (User_current["Honnhan"])! as? String ?? "000"
                let ngaysinh:String = (User_current["Ngaysinh"])! as? String ?? "000"
                let sdt:String = (User_current["SDT"])! as? String ?? "000"
                let thanhpho:String = (User_current["Thanhpho"])! as? String ?? "000"
                let diachi:String = (User_current["Điachi"])! as? String ?? "000"
                let hoten:String = (User_current["Hoten"])! as? String ?? "000"
                self.lb_email.text = email
                self.lb_gioitinh.text = gioitinh
                self.lb_hoten.text = hoten
                self.lb_ngaysinh.text = ngaysinh
                self.lb_sdt.text = sdt
                self.lb_diachi.text = diachi
                self.lb_honnhan.text = honnhan
//                let user:User = User(id: snapshot.key, email: email, linkAvatar: linkAvatar)
//                currenUser = user
//                User_flag = 1
//                User_name = currenUser.email
                
                // lay thong tin ve cho thong tin tong quan
                let User_current2 = (postDict["Thongtintongquan"]) as! NSMutableDictionary
                let capbachientai:String = (User_current2["capbachientai"])! as? String ?? "000@gmail.com"
                let capbacmongmuon:String = (User_current2["capbacmongmuon"])! as? String ?? "000"
                let diadiemmongmuon:String = (User_current2["diadiemmongmuon"])! as? String ?? "000"
                let hinhthuclamviec:String = (User_current2["hinhthuclamviec"])! as? String ?? "000"
                let mucluongtoithieu:String = (User_current2["mucluongtoithieu"])! as? String ?? "000"
                let nganhnghemongmuon:String = (User_current2["nghanhnghemongmuon"])! as? String ?? "000"
                let sonamkinhnghiem:String = (User_current2["sonamkinhnghiem"])! as? String ?? "000"
                let trinhdovanhoa:String = (User_current2["trinhdohocvan"])! as? String ?? "000"
                let vitrimongmuon:String = (User_current2["vitrimongmuon"])! as? String ?? "000"
                
                self.lb_nhanvien.text = vitrimongmuon
                self.lb_capbachientai.text = capbachientai
                self.lb_capbacmongmuon.text = capbacmongmuon
                self.lb_diadiemMM.text = diadiemmongmuon
                self.lb_luongtoithieu.text = mucluongtoithieu
                self.lb_hinhthucLV.text = nganhnghemongmuon
                self.lb_TDCnhat.text = trinhdovanhoa
                self.lb_nganhngheMM.text = nganhnghemongmuon
                
            }else{
                print("khong co du lieu!")
            }
            
        })
    }

}
