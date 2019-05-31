//
//  MH_Trang_Chu_ViewController.swift
//  ha2
//
//  Created by vuminhtam on 4/12/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
//var vistor:CongTy!
//var User_flag:Int!
//var User_name:String!
//var currentUser_1:User_1!
//var currentUser_2:User!
//import Firebase
//var Search_1_flag:Int!
//var tttk:Int!
//var tttq:Int!
//// tao lien ket voi database
//var ref = Database.database().reference()
//let storage = Storage.storage()
//let storageRef = storage.reference(forURL: "gs://authileha2.appspot.com")
//var nguoidung:Int!

class MH_Trang_Chu_ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{

    let f = chucnang()
    var array_congty:Array<CongTy> = Array<CongTy>()
    @IBOutlet weak var tb_List_CongTy: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tttk = 0
        tttq = 0
        tb_List_CongTy.delegate = self
        tb_List_CongTy.dataSource = self
        
        if(User_flag != 1)
        {
            f.dangxuat()
        }
        
        // dua du lieu len database

        let tablename = ref.child("cong ty ung tuyen")
        let congtys = tablename.child("cong ty A")
        // khoi tao 1 user de up len fire base
        let ct:Dictionary<String,String> = ["ten cong ty":"phat dat",
                                            "cong viec":"công nghệ thực phẩm",
                                            "dia chi":"123/123 duong so 2",
                                            "avatar":"https://newimageasia.vn/image/catalog/newimage/Home3-091.png",
                                            "luong":"1000 $",
                                            "motacongviec":"làm việc toàn thời gian, độ tuổi: lớn hơn 17 nhỏ hơn 31, siêng năng, có tinh thần học hỏi, biết tiếng anh. ",
                                            "email":"phatdai@gmail.com",
                                            "sdt":"0956211155"
            
        ]
        congtys.setValue(ct)
        
        let congtysB = tablename.child("cong ty B")
        // khoi tao 1 user de up len fire base
        let ctB:Dictionary<String,String> = ["ten cong ty":"truog hai",
                                            "cong viec":"kỹ thuật dệt",
                                            "dia chi":"1/2 duong so 1",
                                            "avatar":"https://scontent.fsgn4-1.fna.fbcdn.net/v/t1.0-9/49424615_374588286641970_1855015251523665920_n.jpg?_nc_cat=100&_nc_oc=AQkVQwvCyBIme9V1mqrct4mwDXwIZ_wBwoFiX2-21ykgaO1ORQTflMbEwUJbyKGdsLs&_nc_ht=scontent.fsgn4-1.fna&oh=b053cde6d755ebb08cc97244ade4e0d7&oe=5D3CFCD1",
                                            "luong":"2000 $",
                                            "motacongviec":"làm việc toàn thời gian, độ tuổi: lớn hơn 17 nhỏ hơn 31, siêng năng, có tinh thần học hỏi, biết tiếng anh. ",
                                            "email":"thotruong@gmail.com",
                                            "sdt":"0629997541"
        ]
        congtysB.setValue(ctB)
       
        let congtysC = tablename.child("cong ty c")
        // khoi tao 1 user de up len fire base
        let ctC:Dictionary<String,String> = ["ten cong ty":"Thịnh Hải",
                                             "cong viec":"Công nghệ chế biến lâm sản",
                                             "dia chi":"1/7 duong so 1",
                                             "avatar":"https://scontent.fsgn4-1.fna.fbcdn.net/v/t1.0-9/49424615_374588286641970_1855015251523665920_n.jpg?_nc_cat=100&_nc_oc=AQkVQwvCyBIme9V1mqrct4mwDXwIZ_wBwoFiX2-21ykgaO1ORQTflMbEwUJbyKGdsLs&_nc_ht=scontent.fsgn4-1.fna&oh=b053cde6d755ebb08cc97244ade4e0d7&oe=5D3CFCD1",
                                             "luong":"2000 $",
                                             "motacongviec":"làm việc toàn thời gian, độ tuổi: lớn hơn 17 nhỏ hơn 31, siêng năng, có tinh thần học hỏi, biết tiếng anh. ",
                                             "email":"thinhhai@gmail.com",
                                             "sdt":"0629997541"
        ]
        congtysC.setValue(ctC)
        
        tablename.observe(.childAdded, with: { (snapshot) in
            // lay du lieu luu vao postDict
            let postDict = snapshot.value as? [String: AnyObject]
            if(postDict != nil)
            {
                //                print("................\(postDict)...................")
                let tencongty:String = (postDict?["ten cong ty"])! as! String
                let congviec:String = (postDict?["cong viec"])! as! String
                let diachi:String = (postDict?["dia chi"])! as! String
                let avatar:String = (postDict?["avatar"])! as! String
                let luong:String = (postDict?["luong"])! as! String
                let motacongviec:String = (postDict?["motacongviec"])! as! String
                let email:String = (postDict?["email"])! as! String
                let sdt:String = (postDict?["sdt"])! as! String
                
//                let congty:CongTy =  CongTy(idCT: snapshot.key, tencongty: tencongty, congviec: congviec, diachi: diachi,
                let congty:CongTy = CongTy(idCT: snapshot.key, tencongty: tencongty, congviec: congviec, diachi: diachi, avatar: avatar, luong: luong, motacongviec: motacongviec, email: email, sdt: sdt, nghanh: "")
                self.array_congty.append(congty)
                print("........>>>>>>>>>>>>\(self.array_congty.count).................")
                 self.tb_List_CongTy.reloadData()
            }
        })
       
        
    }

    @IBAction func bt_Item_chunang(_ sender: Any) {
        self.chuyen_MH_chucnang()
    }
    
    
    
    // lam viec voi table view
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("............\(array_congty.count)......................")
       return array_congty.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tb_List_CongTy.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! CELLS_Trang_Chu_TableViewCell

        cell.lb1.text = array_congty[indexPath.row].tencongty
        cell.lb2.text = array_congty[indexPath.row].diachi
        cell.lb3.text = array_congty[indexPath.row].congviec
        let avatar = array_congty[indexPath.row].avatar
        let url:URL = URL(string: avatar!)!
        do
        {
            let dulieu:Data = try Data(contentsOf: url)
            cell.Avatar.image = UIImage(data: dulieu)
        }
        catch
        {
            print("khong lay dc du lieu !")
        }
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // lay vi tri dong duoc chon
        vistor = array_congty[indexPath.row]
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_ChiTietCongTy")
        navigationController?.pushViewController(scr!, animated: true)
    }
    
    func chuyen_MH_chucnang() {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_chucnang")
        navigationController?.pushViewController(scr!, animated: true)
       
    }
    
}
