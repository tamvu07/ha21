//
//  MH_chucnang_CT_ViewController.swift
//  ha2
//
//  Created by vuminhtam on 5/14/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Firebase

class MH_chucnang_CT_ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var tableView: UITableView!
    let f = chucnang()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    @IBAction func bt_cancel(_ sender: Any) {
        let alert:UIAlertController = UIAlertController(title: "Bạn chắc chắn muốn đăng xuất !", message: "Xin chọn", preferredStyle: .alert)
        // tao ra 2 button
        let bt_1:UIAlertAction = UIAlertAction(title: "Đăng Xuất", style: .default) { (UIAlertAction) in
            // nho man hinh chinh truy cap den no
//            self.isLogOut()
            self.f.dangxuat()
            self.navigationController?.popToRootViewController(animated: false)
        }
        let bt_2:UIAlertAction = UIAlertAction(title: "Huỷ", style: .cancel, handler: nil)
        
        alert.addAction(bt_1)
        alert.addAction(bt_2)
        self.present(alert, animated: true, completion: nil)
    }
    
    func isLogOut()  {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    // lam viec voi table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        print("............\(array_congty.count)......................")
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        if(indexPath.row == 0)
        {
            if(User_flag == 1)
            {
                cell.textLabel?.text = "Đăng Xuất"
                cell.detailTextLabel?.text = User_name
            }else if(User_flag != 1)
            {
                cell.textLabel?.text = "Đăng Nhập"
                cell.detailTextLabel?.text = ". . ."
            }
            
        }
        else if(indexPath.row == 1)
        {
            cell.textLabel?.text = "Xem hồ sơ ứng viên"
            cell.detailTextLabel?.text = ""
        }else
        {
            cell.textLabel?.text = "Đăng việc làm"
            cell.detailTextLabel?.text = ""
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // lay vi tri dong duoc chon

    }
    
    func chuyen_MH_chucnang() {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_chucnang")
        navigationController?.pushViewController(scr!, animated: true)
        
    }

    
}
