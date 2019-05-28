//
//  MH_Thongtincanhan_CT_ViewController.swift
//  ha2
//
//  Created by vuminhtam on 5/27/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class MH_Thongtincanhan_CT_ViewController: UIViewController {

    @IBOutlet weak var View_11: UIView!
    @IBOutlet weak var avatar_CT: UIImageView!
    @IBOutlet weak var txt_ten: UITextField!
    @IBOutlet weak var txt_email: UITextField!
    @IBOutlet weak var txt_sdt: UITextField!
    @IBOutlet weak var txt_diachi: UITextField!
    var ten1:String!
    var email1:String!
    var sdt1:String!
    var diachi1:String!
    
    var lay_nghe_nghanh_idcongty : [get_nghe_nghanh_idCT] = []
    var congty_hientai: Congty_New = Congty_New.init(ID_Congty: "", quanly_thongtintuyendung: [], quanly_hosoungtuyen: [], thongtincanhanCT: Thongtincanhan_CT.init(email: "", linkAvatar: "", diachi: "", tenCT: "", sdt: "") )
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        avatar_CT.layer.cornerRadius = 50
        avatar_CT.clipsToBounds = true
        self.View_11.backgroundColor = UIColor(patternImage: UIImage(named: "iphone.png")!)
        //////
        get_Congty.shared.fetchData(tableName: ref.child("Nguoidung/Congty"), currentUserId: currentUser_2.id) { (congty, err) in
                if err != "" {
                        print(err)
                }
                else {
                        self.congty_hientai = congty
                    self.txt_ten.text = self.congty_hientai.thongtincanhanCT?.tenCT
                    self.txt_email.text = self.congty_hientai.thongtincanhanCT?.email
                    self.txt_sdt.text = self.congty_hientai.thongtincanhanCT?.sdt
                    self.txt_diachi.text = self.congty_hientai.thongtincanhanCT?.diachi
                    
                    self.ten1 = self.congty_hientai.thongtincanhanCT?.tenCT
                    self.email1 = self.congty_hientai.thongtincanhanCT?.email
                    self.sdt1 = self.congty_hientai.thongtincanhanCT?.sdt
                    self.diachi1 = self.congty_hientai.thongtincanhanCT?.diachi
                    
                    let avatar = self.congty_hientai.thongtincanhanCT?.linkAvatar
                    let url:URL = URL(string: avatar!)!
                    do
                    {
                        let dulieu:Data = try Data(contentsOf: url)
                        self.avatar_CT.image = UIImage(data: dulieu)
                    }
                    catch
                    {
                        print("khong lay dc du lieu !")
                    }
                    
//                        for item in self.congty_hientai.quanly_thongtintuyendung! {
//                            for item2 in item.QL_thongtinTD!{
//                                if(item2.nghanh == timnganh.nghanh)
//                                {
//                                    var nghe_nghanh_ID: get_nghe_nghanh_idCT = get_nghe_nghanh_idCT.init(id_CT: self.congty_hientai.ID_Congty!, nghe: (item2.vitrituyen)!, nghanh: timnganh.nghanh!)
//                                    self.lay_nghe_nghanh_idcongty.append(nghe_nghanh_ID)
//                                }
//                            }
//                        }
                    }
                }
        //////
    }
    
    @IBAction func bt_luu(_ sender: Any) {
        let tableUser = ref.child("Nguoidung").child("Congty").child(currentUser_2.id).child("Thongtincanhan")
        
        let t1:Dictionary<String,String> = [
            "Diachi": txt_diachi.text!,
            "Email": txt_email.text!,
            "LinkAvatar":currentUser_2.linkAvatar,
            "SDT": txt_sdt.text!,
            "TenCT": txt_ten.text!
        ]
        
        tableUser.setValue(t1)

        let alert = UIAlertController(title: "", message: "Đã Lưu", preferredStyle: .alert)
        let bt_ok:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(bt_ok)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func bt_huy(_ sender: Any) {
        let alert:UIAlertController = UIAlertController(title: "Bạn chắc chắn muốn huỷ !", message: "Xin chọn", preferredStyle: .alert)
        // tao ra 2 button
        let bt_1:UIAlertAction = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            self.txt_ten.text = self.ten1
            self.txt_email.text = self.email1
            self.txt_diachi.text = self.diachi1
            self.txt_sdt.text = self.sdt1
        }
        alert.addAction(bt_1)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}
