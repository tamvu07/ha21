//
//  MH_Search_01_01_01_DaCoHoSo_Chitietcongty_ViewController.swift
//  ha2
//
//  Created by vuminhtam on 5/10/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Firebase

class MH_Search_01_01_01_DaCoHoSo_Chitietcongty_ViewController: UIViewController {

    @IBOutlet weak var bt_chon1_CV: DLRadioButton!
    let ref = Database.database().reference()
    @IBOutlet weak var lb_vitrimuontuyen: UILabel!
    var chon_HS = 0
    
    var currentUser: UngVien_New = UngVien_New.init(userID: "", Thongtincanhan: Thongtincanhan.init(email: currentUser_1.email, linkAvatar: currentUser_1.linkAvatar, hoso: currentUser_1.status_HS), Thongtinlienhe: Thongtinlienhe.init(email: "", gioitinh: "", honnhan: "", hoten: "", ngaysinh: "", sdt: "", thanhpho: "", diachi: ""), Thongtintongquan: Thongtintongquan.init(capbachientai: "", capbacmongmuon: "", diadiemmongmuon: "", hinhthuclamviec: "", mucluongtoithieu: "", nghanhnghemongmuon: "", sonamkinhnghiem: "", trinhdohocvan: "", vitrimongmuon: ""))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        get_ungvien.shared.fetchData(tableName: ref.child("Nguoidung/Ungvien"), currentUserId: currentUser_1.id) { (UngVien_New, err) in
            if err != "" {
                print(err)
            }
            else {
                self.currentUser = UngVien_New
                let donxinviec = self.currentUser.Thongtintongquan?.vitrimongmuon
                self.bt_chon1_CV.setTitle("\((donxinviec)!)", for: .normal)
            }
        }
        
//        lb_vitrimuontuyen.text = vistor.congviec
        lb_vitrimuontuyen.text = chitiet_congty.nghe
        
//        var tablename = ref.child("Nguoidung").child("Ungvien")
//        // Listen for new comments in the Firebase database
//        tablename.observe(.childAdded, with: { (snapshot) in
//            // nếu lấy được dữ liệu postDict từ sever về và id của user có trong postDict
//            print(".......user hien tai la :\(currentUser_1.id).....spost la 1:\(snapshot.key)...\n")
//            if let postDict = snapshot.value as? [String : AnyObject], currentUser_1.id == snapshot.key
//            {
//
//                // lay thong tin ve cho thong tin tong quan
//                let User_current2 = (postDict["Thongtintongquan"]) as! NSMutableDictionary
//                let vitrimongmuon:String = (User_current2["vitrimongmuon"])! as? String ?? "000"
//                self.bt_chon1_CV.setTitle("\(vitrimongmuon)", for: .normal)
//
//            }else{
//                print("khong co du lieu!")
//            }
//
//        })
    }
    
    //radio button
    @objc @IBAction private func logSelectedButton(_ radioButton : DLRadioButton) {
        if (radioButton.isMultipleSelectionEnabled) {
            for button in radioButton.selectedButtons() {
                print(String(format: "%@ is selected ha .\n", button.titleLabel!.text!));
            }
        } else {
            RadioButtonValue = radioButton.selected()?.titleLabel?.text!
            //            print(String(format: "%@ is selected.\n", RadioButtonValue));
            let x:String = String(format: "%@", RadioButtonValue);
            if(x == self.currentUser.Thongtintongquan?.vitrimongmuon as! String)
            {
               chon_HS = 1
            }
        }
    }

    @IBAction func bt_trangchu(_ sender: Any) {

        let m = navigationController?.viewControllers[1]
        navigationController?.popToViewController(m!, animated: true)
    }
    
    @IBAction func bt_nopHoSo(_ sender: Any) {
        if(chon_HS == 1)
        {
            
            var tablename = ref.child("Nguoidung").child("Congty")
            // Listen for new comments in the Firebase database
            tablename.observe(.childAdded, with: { (snapshot) in
                // nếu lấy được dữ liệu postDict từ sever về và id của user có trong postDict
                if let postDict = snapshot.value as? [String : AnyObject], chitiet_congty.id_CT == snapshot.key
                {
                    var tablename2 = self.ref.child("Nguoidung").child("Congty").child("\(snapshot.key)").child("Hosoungtuyen").childByAutoId()
                    let tt:Dictionary<String,String> = [
                        "ID_Hoso_Ungven": currentUser_1.id,
                        "Nganh": chitiet_congty.nghanh!,
                        "Vitrituyen": chitiet_congty.nghe!
                    ]
                    tablename2.setValue(tt)
                    let alert:UIAlertController = UIAlertController(title: "Đã nộp đơn, xin bạn chờ phản hồi từ công ty.", message: "", preferredStyle: .alert)
                    let bt:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alert.addAction(bt)
                    self.present(alert, animated: true, completion: nil)
                    
                }else{
                    print("khong tim thay ung vien !")
                }
            })
            
            
        }else{
            let alert:UIAlertController = UIAlertController(title: "Bạn phải chọn hồ sơ !", message: "", preferredStyle: .alert)
            let bt:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(bt)
            self.present(alert, animated: true, completion: nil)
        }
        /////

                let scr = storyboard?.instantiateViewController(withIdentifier: "MH_nopHoSo_thanhcong")
        self.navigationController?.pushViewController(scr!, animated: true)
    }
    
    @IBAction func bt_quanLyHoSo(_ sender: Any) {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_Taohoso")
        self.navigationController?.pushViewController(scr!, animated: true)
    }
    
}
