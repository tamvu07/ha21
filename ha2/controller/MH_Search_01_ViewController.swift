//
//  MH_Search_01_ViewController.swift
//  ha2
//
//  Created by vuminhtam on 5/2/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
var Ng:String!
var timnganh: get_nghanh_idCT!

class MH_Search_01_ViewController: UIViewController {

    
    @IBOutlet weak var SearchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    let Array_Nganh = [
        "Nhóm ngành sản xuất và chế biến",
        "Nhóm ngành kiến trúc và xây dựng",
        "Nhóm những ngành kinh doanh",
        "Nhóm các ngành công nghệ - thông tin",
        "Nhóm ngành luật - nhân văn",
        "Nhóm ngành nghệ thuật - thẩm mỹ - đồ họa",
        "Nhóm ngành báo chí - khoa học và xã hội",
        "Nhóm ngành khoa học cơ bản",
        "Nhóm ngành nông - lâm - ngư nghiệp"
    ]
    
    var search_department = [String]()
    var searching = false
//     var nganh_nhieu_CT: [QL_nhung_nghanh_CT] = []
    var congty_hientai: Congty_New = Congty_New.init(ID_Congty: "", quanly_thongtintuyendung: [], quanly_hosoungtuyen: [], thongtincanhanCT: Thongtincanhan_CT.init(email: "", linkAvatar: "", diachi: "", tenCT: "", sdt: "") )
    var lay_nghanh_idcongty : [get_nghanh_idCT] = []
    
//    var dem_CT:[Int] = []
//    var dem_ten_CT:[String] = []
//    var ten_nghanh:[String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
        
//        var tablename = ref.child("Nguoidung").child("Congty")
//        // Listen for new comments in the Firebase database
//        tablename.observe(.childAdded, with: { (snapshot) in
//            // nếu lấy được dữ liệu postDict từ sever về và id của user có trong postDict
//           let postDict = snapshot.value as? [String : AnyObject]
//            if(postDict != nil)
//            {
//                // lay danh sach cai nghanh cua cony ty ve
//                get_Congty.shared.fetchData(tableName: ref.child("Nguoidung/Congty"), currentUserId: snapshot.key) { (congty, err) in
//                    if err != "" {
//                        print(err)
//                    }
//                    else {
//                        self.congty_hientai = congty
//                        var m: [Quanly_Thongtintuyendung] = []
//                        var N_ID_CT: QL_nhung_nghanh_CT = QL_nhung_nghanh_CT.init(id_CT: "", mang_TTTD: [], mang_TTCN: Thongtincanhan_CT.init(email: "", linkAvatar: "", diachi: "", tenCT: "", sdt: ""))
//
//                        var t : Quanly_Thongtintuyendung = Quanly_Thongtintuyendung.init(id_TTTD: "", QL_thongtinTD: Thongtintuyendung_CT.init(luong: "", motachung: "", nghanh: "", soluongHS: "", vitrituyen: ""))
//                        var t2 : Thongtincanhan_CT = Thongtincanhan_CT.init(email: "", linkAvatar: "", diachi: "", tenCT: "", sdt: "")
//                        for item in self.congty_hientai.quanly_thongtintuyendung! {
//                            t.id_TTTD = item.id_TTTD
//                            t.QL_thongtinTD = item.QL_thongtinTD
//
//                            m.append(t)
//                        }
//
//                        t2.email = self.congty_hientai.thongtincanhanCT?.email
//                        t2.linkAvatar = self.congty_hientai.thongtincanhanCT?.linkAvatar
//                        t2.diachi = self.congty_hientai.thongtincanhanCT?.diachi
//                        t2.tenCT = self.congty_hientai.thongtincanhanCT?.tenCT
//                        t2.sdt = self.congty_hientai.thongtincanhanCT?.sdt
//
//
//                        N_ID_CT.id_CT = snapshot.key
//                        N_ID_CT.mang_TTTD = m
//                        N_ID_CT.mang_TTCN = t2
//                        self.nganh_nhieu_CT.append(N_ID_CT)
//                    }
//                }
//            }
//
//        })
//
//        var CT_dem = 0
//        var Ng_dem = 0
//        for item in nganh_nhieu_CT{
//
//            for item2 in item.mang_TTTD! {
//                ten_nghanh.append(item2.QL_thongtinTD?.nghanh as! String)
//            }
//            CT_dem = CT_dem + 1
//            dem_CT.append(CT_dem)
//            dem_ten_CT.append("\(item.mang_TTCN?.tenCT)")
//        }
//
        
        
        ////
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
                        print("....cong ty la :\(congty).............\n")
                        print("....ten cong ty la :\(congty.thongtincanhanCT?.tenCT).............\n")
                        self.congty_hientai = congty
                        // lay id cong ty
                        
                        for item in self.congty_hientai.quanly_thongtintuyendung! {
                            // lay nghanh
                            var nghanh_ID: get_nghanh_idCT = get_nghanh_idCT.init(id_CT: self.congty_hientai.ID_Congty!, nghanh: (item.QL_thongtinTD?.nghanh)!)
                            // dua id cong ty va nganh vao 1 mang
                            self.lay_nghanh_idcongty.append(nghanh_ID)
//                            print("ID nghanh la :.. \(item.id_TTTD )....\n")
//                            print("nghanh la :.. \(item.QL_thongtinTD?.nghanh )....\n")
//                            print("luong la :.. \(item.QL_thongtinTD?.luong)....\n")

                        }
                       
                        self.tableView.reloadData()
                        
                    }
                }
            }
            
        })
        

        /////
        

    }
    
    func goto_MH_Search_01_01()
    {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_Search_01_01")
        navigationController?.pushViewController(scr!, animated: true)
    }
}


extension MH_Search_01_ViewController: UITableViewDataSource,UITableViewDelegate
{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return search_department.count
        }else{
//            return Array_Nganh.count
 
//            return ten_nghanh.count
            return lay_nghanh_idcongty.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        if searching {
            cell.textLabel?.text = search_department[indexPath.row]
        }else{
//            cell.textLabel?.text = Array_Nganh[indexPath.row]

            ////
//            cell.textLabel?.text = ten_nghanh[indexPath.row]
            ////
            cell.textLabel?.text = lay_nghanh_idcongty[indexPath.row].nghanh
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var text = ""
        if searching {
            text = search_department[indexPath.row]
        }else{
//            text = Array_Nganh[indexPath.row]
            text = lay_nghanh_idcongty[indexPath.row].nghanh!
        }
        Ng = text
        let a:get_nghanh_idCT = get_nghanh_idCT.init(id_CT: lay_nghanh_idcongty[indexPath.row].id_CT!, nghanh: lay_nghanh_idcongty[indexPath.row].nghanh!)
        timnganh = a
        self.goto_MH_Search_01_01()
    }
}

extension MH_Search_01_ViewController: UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search_department = Array_Nganh.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text  = ""
        tableView.reloadData()
    }
}
