//
//  MH_Search_01_01_01_Chitietcongty_ViewController.swift
//  ha2
//
//  Created by vuminhtam on 5/3/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class MH_Search_01_01_01_Chitietcongty_ViewController: UIViewController {

    @IBOutlet weak var hinh_ct: UIImageView!
    @IBOutlet weak var lb_tenct: UILabel!
    @IBOutlet weak var lb_diachi: UILabel!
    @IBOutlet weak var lb_congviec: UILabel!
    @IBOutlet weak var lb_mucluong: UILabel!
    @IBOutlet weak var lb_email: UILabel!
    @IBOutlet weak var lb_sdt: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lb_tenct.text = vistor.tencongty
        lb_diachi.text = vistor.diachi
        lb_congviec.text = vistor.congviec
        lb_mucluong.text = vistor.luong
        lb_email.text = vistor.email
        lb_sdt.text = vistor.sdt
        
        let avatar = vistor.avatar
        let url:URL = URL(string: avatar!)!
        do
        {
            let dulieu:Data = try Data(contentsOf: url)
            hinh_ct.image = UIImage(data: dulieu)
        }
        catch
        {
            print("khong lay dc du lieu !")
        }
        
    }
    
    @IBAction func bt_nopdon(_ sender: Any) {
        if(currentUser_1.status_HS == 1)
        {
            goto_MH_Search_01_01_01_DaCoHoSo_Chitietcongty()
        }else{
            goto_MH_Taohoso()
        }
    }
    
    func goto_MH_Taohoso()
    {
        
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_Taohoso")
        navigationController?.pushViewController(scr!, animated: true)
    }
    
    func goto_MH_xemHoSo()
    {
        
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_xemHoSo")
        navigationController?.pushViewController(scr!, animated: true)
    }

    func goto_MH_Search_01_01_01_DaCoHoSo_Chitietcongty()
    {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_Search_01_01_01_DaCoHoSo_Chitietcongty")
        navigationController?.pushViewController(scr!, animated: true)
    }
}
