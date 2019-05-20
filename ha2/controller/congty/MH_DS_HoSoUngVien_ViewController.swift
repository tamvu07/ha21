//
//  MH_DS_HoSoUngVien_ViewController.swift
//  ha2
//
//  Created by vuminhtam on 5/20/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class MH_DS_HoSoUngVien_ViewController: UIViewController {
    var array_Hosoungvien:Array<Hosoungtuyen> = Array<Hosoungtuyen>()
        var Ungvien_current: UngVien_New = UngVien_New.init(userID: "", Thongtincanhan: Thongtincanhan.init(email: "", linkAvatar: "", hoso: 0), Thongtinlienhe: Thongtinlienhe.init(email: "", gioitinh: "", honnhan: "", hoten: "", ngaysinh: "", sdt: "", thanhpho: "", diachi: ""), Thongtintongquan: Thongtintongquan.init(capbachientai: "", capbacmongmuon: "", diadiemmongmuon: "", hinhthuclamviec: "", mucluongtoithieu: "", nghanhnghemongmuon: "", sonamkinhnghiem: "", trinhdohocvan: "", vitrimongmuon: ""))
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        let nidName = UINib(nibName: "Cell_MH_HoSoUngTuyen_TableViewCell", bundle: nil)
        tableView.register(nidName, forCellReuseIdentifier: "Cell_MH_HoSoUngTuyen")
        // lay thong tin cua ung vien da nop ho so ve
       let  tablename = ref.child("Nguoidung").child("Congty")
        tablename.observe(.childAdded, with: { (snapshot) in
            // nếu lấy được dữ liệu postDict từ sever về và id của user có trong postDict
            if let postDict = snapshot.value as? [String : AnyObject], (currentUser_2.id)! == snapshot.key
            {
                if(postDict != nil)
                {
                    if((postDict["Hosoungtuyen"]) != nil)
                    {
                        let HS = (postDict["Hosoungtuyen"]) as! NSMutableDictionary
                        let ID_Hoso_Ungtuyen:String = HS["ID_Hoso_Ungven"] as? String ?? "0"
                        let Nghanh:String = HS["Nganh"] as? String ?? "000"
                        let Vitrituyen:String = HS["Vitrituyen"] as? String ?? "..."
                        
                        let HSUT:Hosoungtuyen = Hosoungtuyen(id: ID_Hoso_Ungtuyen, nghanh: Nghanh, vitrituyen: Vitrituyen)
                        self.array_Hosoungvien.append(HSUT)
                    }
                }

            }else{
                print("khong thay id trong cong ty !")
            }
        })
    }
    


}

extension MH_DS_HoSoUngVien_ViewController: UITableViewDelegate , UITableViewDataSource  {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array_Hosoungvien.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell_MH_HoSoUngTuyen", for: indexPath) as! Cell_MH_HoSoUngTuyen_TableViewCell
        
        get_ungvien.shared.fetchData(tableName: ref.child("Nguoidung/Ungvien"), currentUserId: "\(array_Hosoungvien[indexPath.row].id)") { (UngVien_New, err) in
            if err != "" {
                print(err)
            }
            else {
                self.Ungvien_current = UngVien_New
                let tenUV = self.Ungvien_current.Thongtinlienhe?.hoten
               let linkavatar = self.Ungvien_current.Thongtincanhan?.linkAvatar
                let vitrimonmuon = self.Ungvien_current.Thongtintongquan?.vitrimongmuon
                cell.lb_hoten.text = tenUV
                cell.lb_vitrituyen.text = vitrimonmuon
                let url:URL = URL(string: linkavatar!)!
                do
                {
                    let dulieu:Data = try Data(contentsOf: url)
                    cell.avatar_1.image = UIImage(data: dulieu)
                }
                catch
                {
                    print("khong lay dc du lieu !")
                }
            }
        
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
