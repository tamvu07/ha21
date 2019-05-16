//
//  MH_ChiTiet_CongTy_ViewController.swift
//  ha2
//
//  Created by vuminhtam on 4/16/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class MH_ChiTiet_CongTy_ViewController: UIViewController {

    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var lb_tenct: UILabel!
    @IBOutlet weak var lb_congviec: UILabel!
    @IBOutlet weak var lb_mucluong: UILabel!
    @IBOutlet weak var text_view: UITextView!
    @IBOutlet weak var lb_email: UILabel!
    @IBOutlet weak var lb_sdt: UILabel!
    @IBOutlet weak var lb_diachi: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let avatar1 = vistor.avatar
        let url:URL = URL(string: avatar1!)!
        avatar.layer.cornerRadius = avatar.frame.width/2
        
        do
        {
            let dulieu:Data = try! Data(contentsOf: url)
            avatar.image = UIImage(data: dulieu)
        }
        catch
        {
            print("loi load avatar")
        }
        lb_tenct.text = vistor.tencongty
        lb_congviec.text = vistor.congviec
        lb_diachi.text = vistor.diachi
        lb_mucluong.text = vistor.luong
        text_view.text = vistor.motacongviec
        lb_email.text = vistor.email
        lb_sdt.text = vistor.sdt
    }
    


}
