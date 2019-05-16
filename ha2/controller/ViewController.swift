//
//  ViewController.swift
//  ha2
//
//  Created by vuminhtam on 4/11/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var register: UIButton!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var txt_email: UITextField!
    @IBOutlet weak var txt_pass: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        login.layer.cornerRadius = login.frame.width/2
        register.layer.borderColor = UIColor.blue.cgColor
        register.layer.borderWidth = 2
        register.layer.cornerRadius = 5
        register.contentEdgeInsets = UIEdgeInsets(top: 5,left: 5,bottom: 5,right: 5)
    }

    // button dang nhap
    @IBAction func bt_Login(_ sender: Any) {
        let email = txt_email.text
        let pass = txt_pass.text
        if(email == "" || pass == "")
        {
            let alert  = UIAlertController(title: "Thong bao", message: "Email hoac password chua nhap !", preferredStyle: .alert)
            let btn_ok:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(btn_ok)
            present(alert, animated: true, completion: nil)
        }
        else
        {
           Auth.auth().signIn(withEmail: txt_email.text!, password: txt_pass.text!) { [weak self] user, error in
            if(error == nil)
            {
                    print("....... dang nhap thanh cong ............")
                let user = Auth.auth().currentUser
                let avatar: String = user?.photoURL?.absoluteString ?? ""
                currenUser = User.init(id: (user?.uid)!, email: (user?.email)!, linkAvatar: avatar)
                var KT = "Ungvien"
                
                // ref.child de truy van table trong database , lay ra ID current USER hien tai
                var tablename = ref.child("Nguoidung").child("\(KT)")
                // Listen for new comments in the Firebase database
                tablename.observe(.childAdded, with: { (snapshot) in
                    // nếu lấy được dữ liệu postDict từ sever về và id của user có trong postDict
                    if let postDict = snapshot.value as? [String : AnyObject], currenUser.id == snapshot.key
                    {
                        let User_current = (postDict["Thongtincanhan"]) as! NSMutableDictionary
                        let email:String = (User_current["Email"])! as? String ?? "000@gmail.com"
                        let linkAvatar:String = (User_current["LinkAvatar"])! as? String ?? "000"
                        let user:User = User(id: snapshot.key, email: email, linkAvatar: linkAvatar)
                        currenUser = user
                                         User_flag = 1
                                        User_name = currenUser.email
                                        self!.goto_MH_chucnang()
                    }
                    else {
//                        print("KHONG CO POSTDICT HOAC ID USER KHONG CO TRONG TABLE USER1")
                        KT = "Congty"
                       var  tablename2 = ref.child("Nguoidung").child("\(KT)")
                        tablename2.observe(.childAdded, with: { (snapshot) in
                        if let postDict = snapshot.value as? [String : AnyObject], currenUser.id == snapshot.key
                        {
                            User_flag = 1
                            User_name = currenUser.email
                            self!.goto_MH_chucnang_CT()
                        }
                        else{
                            let alert:UIAlertController = UIAlertController(title: "Xin bạn phai đăng ký trươc khi đăng nhập !", message: "", preferredStyle: .alert)
                            // tao ra 2 button

                            let bt:UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                            alert.addAction(bt)
                            self!.present(alert, animated: true, completion: nil)
                            print("........tim khong thay ai !...............\n")
                        }
                        })
                    }
                })
                
                
                
                
            }
            else
            {

                // dang nhap khong thanh cong
                let alert = UIAlertController(title: "Thong Bao", message: "Email hoac password khong chinh xac", preferredStyle: .alert)
                let btn_ok:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(btn_ok)
                self?.present(alert, animated: true, completion: nil)
                
            }
            }
        }

    }
    
    // button dang ky
    
    @IBAction func bt_dangky(_ sender: Any) {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_dangky")
//        self.present(scr!, animated: true, completion: nil)
        navigationController?.pushViewController(scr!, animated: true)
    }
    
     func goto_MH_chucnang()
    {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_chucnang")
        navigationController?.pushViewController(scr!, animated: true)
    }

 
    func    goto_MH_chucnang_CT()
    {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_chucnang_CT")
        navigationController?.pushViewController(scr!, animated: true)
    }
}

