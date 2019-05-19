//
//  MH_nopHoSo_thanhcong_ViewController.swift
//  ha2
//
//  Created by vuminhtam on 5/19/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class MH_nopHoSo_thanhcong_ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func bt_trangchu(_ sender: Any) {
        let m = navigationController?.viewControllers[1]
        navigationController?.popToViewController(m!, animated: true)
    }
    
    
    @IBAction func bt_quanLyHoSo(_ sender: Any) {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_Taohoso")
        self.navigationController?.pushViewController(scr!, animated: true)
    }
    
    
}
