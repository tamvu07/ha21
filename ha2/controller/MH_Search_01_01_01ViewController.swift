//
//  MH_Search_01_01_01ViewController.swift
//  ha2
//
//  Created by vuminhtam on 5/2/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
var chitiet_congty: get_chitiet_CT!
class MH_Search_01_01_01ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var array_congty:Array<CongTy> = Array<CongTy>()
    var lay_chitiet_congty : [get_chitiet_CT] = []
    var congty_hientai: Congty_New = Congty_New.init(ID_Congty: "", quanly_thongtintuyendung: [], quanly_hosoungtuyen: [], thongtincanhanCT: Thongtincanhan_CT.init(email: "", linkAvatar: "", diachi: "", tenCT: "", sdt: "") )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        ///
        var tablename = ref.child("Nguoidung").child("Congty")
        // Listen for new comments in the Firebase database
        tablename.observe(.childAdded, with: { (snapshot) in
            // nếu lấy được dữ liệu postDict từ sever về và id của user có trong postDict
            let postDict = snapshot.value as? [String : AnyObject]
            if(postDict != nil)
            {
                // lay danh sach cai nghanh cua cony ty ve
                get_Congty.shared.fetchData(tableName: ref.child("Nguoidung/Congty"), currentUserId: snapshot.key) { (congty, err) in
                    if err != "" {
                        print(err)
                    }
                    else {
                        
                        self.congty_hientai = congty
                        // lay id cong ty
                        
                        for item in self.congty_hientai.quanly_thongtintuyendung! {
                            // lay ra nghe trong nghanh cua tung cong ty
                            for item2 in item.QL_thongtinTD!{
                                if((item2.nghanh == timnganh.nghanh) && (item2.vitrituyen == tim_nghe_nganh.nghe))
                                {
//                                    var chitiet_CT: get_chitiet_CT = get_chitiet_CT.init(id_CT: self.congty_hientai.ID_Congty!,ten: (self.congty_hientai.thongtincanhanCT?.tenCT)! ,linkAvatar: (self.congty_hientai.thongtincanhanCT?.linkAvatar)!, nghe: tim_nghe_nganh.nghe as! String, nghanh: timnganh.nghanh!, luong: (item2.nghanh, motacongviec: (item2.motachung)!, email: (self.congty_hientai.thongtincanhanCT?.email)!, sdt: (self.congty_hientai.thongtincanhanCT?.sdt)!,diachi: (self.congty_hientai.thongtincanhanCT?.diachi)!))
                                    var chitiet_CT: get_chitiet_CT = get_chitiet_CT.init(id_CT: self.congty_hientai.ID_Congty!, ten: (self.congty_hientai.thongtincanhanCT?.tenCT)!, linkAvatar: (self.congty_hientai.thongtincanhanCT?.linkAvatar)!, nghe: (item2.vitrituyen)!, nghanh: (item2.nghanh)!, luong: (item2.luong)!, motacongviec: (item2.motachung)!, email: (self.congty_hientai.thongtincanhanCT?.email)!, sdt: (self.congty_hientai.thongtincanhanCT?.sdt)!, diachi: (self.congty_hientai.thongtincanhanCT?.diachi)!)
                                    // dua id cong ty va nghe va nganh vao 1 mang
                                    self.lay_chitiet_congty.append(chitiet_CT)
                                    
                                }
                            }

                            
                        }
                        self.tableView.reloadData()
                    }
                }
                
            }
        })
        ///
        
        ////
        
        
//        let tablename = ref.child("Nguoidung").child("Congty")
//        tablename.observe(.childAdded, with: { (snapshot) in
//            // nếu lấy được dữ liệu postDict từ sever về và id của user có trong postDict
//           let postDict = snapshot.value as? [String : AnyObject]
//            if(postDict != nil){
//            // lay ra thong tin cua cong ty
//            let User_current_2 = (postDict!["Thongtincanhan"]) as! NSMutableDictionary
//                let email:String = (User_current_2["Email"])! as? String ?? "000@gmail.com"
//                let linkAvatar:String = (User_current_2["LinkAvatar"])! as? String ?? "000"
//                let diachi:String = (User_current_2["Diachi"])! as? String ?? "..."
//                let sdt:String = (User_current_2["SDT"])! as? String ?? "..."
//                let tenCT:String = (User_current_2["TenCT"])! as? String ?? "..."
//
//            // lay ra thong tin tuyen dung tu cong ty
//            let Thongtin_tuyen = (postDict!["Thongtintuyendung"]) as! NSMutableDictionary
//            let luong:String = (Thongtin_tuyen["Luong"])! as? String ?? "00$"
//            let motachung:String = (Thongtin_tuyen["Motachung"])! as? String ?? ".."
//            let nghanh:String = (Thongtin_tuyen["Nganh"])! as? String ?? "..."
//            let soluongHS:String = (Thongtin_tuyen["SoluongHS"])! as? String ?? "..."
//            let vitrituyen:String = (Thongtin_tuyen["Vitrituyen"])! as? String ?? "..."
//
//
//            let congty:CongTy = CongTy(idCT: snapshot.key, tencongty: tenCT, congviec: vitrituyen, diachi: diachi, avatar: linkAvatar, luong: luong, motacongviec: motachung, email: email, sdt: sdt, nghanh: nghanh)
//
//                        if(vitrituyen == JOB)
//                        {
//                            self.array_congty.append(congty)
//                        }
//            self.tableView.reloadData()
//        }
//
//        })
        
//        let tablename = ref.child("cong ty ung tuyen")
//        tablename.observe(.childAdded, with: { (snapshot) in
//        // lay du lieu luu vao postDict
//        let postDict = snapshot.value as? [String: AnyObject]
//        if(postDict != nil)
//        {
//            //                print("................\(postDict)...................")
//            let tencongty:String = (postDict?["ten cong ty"])! as! String
//            let congviec:String = (postDict?["cong viec"])! as! String
//            let diachi:String = (postDict?["dia chi"])! as! String
//            let avatar:String = (postDict?["avatar"])! as! String
//            let luong:String = (postDict?["luong"])! as! String
//            let motacongviec:String = (postDict?["motacongviec"])! as! String
//            let email:String = (postDict?["email"])! as! String
//            let sdt:String = (postDict?["sdt"])! as! String
//
//            //                let congty:CongTy =  CongTy(idCT: snapshot.key, tencongty: tencongty, congviec: congviec, diachi: diachi,
//            let congty:CongTy = CongTy(idCT: snapshot.key, tencongty: tencongty, congviec: congviec, diachi: diachi, avatar: avatar, luong: luong, motacongviec: motacongviec, email: email, sdt: sdt)
//            if(congviec == JOB)
//            {
//                self.array_congty.append(congty)
//            }
//
//            print("........>>>>>>>>>>>>\(self.array_congty.count).................")
//            self.tableView.reloadData()
//        }
//    })
      
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let titleView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 25))
        let label:UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 25))
        label.text = "\(JOB!)"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        titleView.addSubview(label)
        
        self.navigationItem.titleView = titleView
    }
    
    // chuyen man hinh chi tiet cua cong ty
    func goto_MH_Search_01_01_01_Chitietcongty()
    {
        
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_Search_01_01_01_Chitietcongty")
        navigationController?.pushViewController(scr!, animated: true)
    }

}

extension MH_Search_01_01_01ViewController: UITableViewDataSource,UITableViewDelegate
{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return array_congty.count
        return lay_chitiet_congty.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)  as! CELL_Search_01_01_01TableViewCell
//        cell.txt_ten.text = array_congty[indexPath.row].tencongty
//        cell.txt_dc.text = array_congty[indexPath.row].diachi
//        cell.txt_cv.text = array_congty[indexPath.row].congviec
//        cell.txt_L.text = array_congty[indexPath.row].luong
//        let avatar = array_congty[indexPath.row].avatar
//        let url:URL = URL(string: avatar!)!
//        do
//        {
//            let dulieu:Data = try Data(contentsOf: url)
//            cell.hinh_CT.image = UIImage(data: dulieu)
//        }
//        catch
//        {
//            print("khong lay dc du lieu !")
//        }
        
        cell.txt_ten.text = lay_chitiet_congty[indexPath.row].ten
        cell.txt_dc.text = lay_chitiet_congty[indexPath.row].diachi
        cell.txt_cv.text = lay_chitiet_congty[indexPath.row].nghe
        cell.txt_L.text = lay_chitiet_congty[indexPath.row].luong
        let avatar = lay_chitiet_congty[indexPath.row].linkAvatar
        let url:URL = URL(string: avatar!)!
        do
        {
            let dulieu:Data = try Data(contentsOf: url)
            cell.hinh_CT.image = UIImage(data: dulieu)
        }
        catch
        {
            print("khong lay dc du lieu !")
        }

        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

//        vistor = array_congty[indexPath.row]
        chitiet_congty = lay_chitiet_congty[indexPath.row]
            goto_MH_Search_01_01_01_Chitietcongty()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
