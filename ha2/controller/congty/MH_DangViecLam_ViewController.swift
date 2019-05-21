//
//  MH_DangViecLam_ViewController.swift
//  ha2
//
//  Created by vuminhtam on 5/21/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class MH_DangViecLam_ViewController: UIViewController {

    @IBOutlet weak var txt_nghanh: UITextField!
    @IBOutlet weak var txt_vitri: UITextField!
    @IBOutlet weak var txt_luong: UITextField!
    @IBOutlet weak var txt_mota: UITextView!
    @IBOutlet weak var txt_soluongHS: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func bt_huy(_ sender: Any) {
        
    }
    @IBAction func bt_dang(_ sender: Any) {
        if(txt_nghanh.text == "" || txt_vitri.text == "" || txt_luong.text == "" || txt_mota.text == "" || txt_soluongHS.text == "")
        {
            let alert  = UIAlertController(title: "Thông báo", message: "Bạn vui lòng nhập đủ dữ liêu !", preferredStyle: .alert)
            let btn_ok:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(btn_ok)
            present(alert, animated: true, completion: nil)
        }
        else {
            let nghanh = txt_nghanh.text
            let vitri = txt_vitri.text
            let luong = txt_luong.text
            let mota = txt_mota.text
            let soluongHS = txt_soluongHS.text
            
            let table_dangviec = ref.child("Nguoidung").child("Congty").child(currentUser_2.id).child("Thongtintuyendung")
            
            let t1:Dictionary<String,String> = [
                "Luong": luong!,
                "Motachung": mota!,
                "Nganh": nghanh!,
                "SoluongHS": soluongHS!,
                "Vitrituyen": vitri!
            ]
            
            table_dangviec.setValue(t1)
            
            let alert  = UIAlertController(title: "", message: "Đã đãng việc làm!", preferredStyle: .alert)
            let btn_ok:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(btn_ok)
            present(alert, animated: true, completion: nil)
            
        }
    }
    


}
