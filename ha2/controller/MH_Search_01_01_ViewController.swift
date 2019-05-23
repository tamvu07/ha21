//
//  MH_Search_01_01_ViewController.swift
//  ha2
//
//  Created by vuminhtam on 5/2/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
var JOB:String!
var t1:Int!
var t2:Array<String>!
var tim_nghe_nganh: get_nghe_nghanh_idCT!
class MH_Search_01_01_ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var SearchBar: UISearchBar!
    var lay_nghe_nghanh_idcongty : [get_nghe_nghanh_idCT] = []
       var congty_hientai: Congty_New = Congty_New.init(ID_Congty: "", quanly_thongtintuyendung: [], quanly_hosoungtuyen: [], thongtincanhanCT: Thongtincanhan_CT.init(email: "", linkAvatar: "", diachi: "", tenCT: "", sdt: "") )
    
    let Array_job_1 = [
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
    
    let ARR_JOB_0 = [
        "công nghệ thực phẩm",
        "công nghệ chế biến sau thu hoạch",
        "Công nghệ chế biến thủy sản",
        "kỹ thuật dệt",
        "Công nghệ da giầy",
        "Công nghệ chế biến lâm sản"
    ]
    
    let ARR_JOB_1 = [
        "kiến trúc",
        "kinh tế và quản lý đô thị",
        "Kỹ thuật công trình biển",
        "kỹ thuật xây dựng",
        "kinh tế xây dựng",
        "quản lý xây dựng",
        "Kỹ thuật xây dựng công trình giao thông",
        "Công nghệ kỹ thuật công trình xây dựng"
        ]
    
    let ARR_JOB_2 = [
        "quản trị kinh doanh",
        "quản trị dịch vụ du lịch và lữ hành",
        "quản trị khách sạn",
        "Marketing",
        "nghề môi giới bất động sản",
        "kinh doanh quốc tế",
        "kế toán",
        "kiểm toán",
        "quản trị nhân lực",
        "quản trị văn phòng"
        ]

    let ARR_JOB_3 = [
        "khoa học - máy tính",
        "truyền thông đa phương tiện",
        "kỹ thuật phần mềm",
        "công nghệ thông tin"
    ]

    let ARR_JOB_4 = [
        "luật kinh tế",
        "Luật quốc tế",
        "việt nam học",
        "ngôn ngữ Anh – Tiếng Anh",
        "ngôn ngữ Nga – Tiếng Nga",
        "ngôn ngữ Pháp – Tiếng Pháp",
        "ngôn ngữ Trung – Tiếng Trung",
        "ngôn ngữ Đức – Tiếng Đức",
        "ngôn ngữ Tây Ban Nha – Tiếng Tây Ban Nha",
        "ngôn ngữ Bồ Đào Nha – Bồ Đào Nha",
        "ngôn ngữ Italya – Tiếng Italya",
        "ngôn ngữ Nhật – Tiếng Nhật",
        "ngôn ngữ Hàn Quốc – Tiếng Hàn Quốc",
        "ngôn ngữ A rập – Tiếng Ả rập",
        "ngôn ngữ Quốc Tế Học",
        "Đông Phương Học",
        "Đông Nam Á học",
        "Trung Quốc học",
        "Nhật Bản học",
        "Hàn Quốc học",
        "khu vực Thái Bình Dương học",
        "triết học",
        "lịch sử học",
        "văn học",
        "văn hóa học",
        "quản lý văn hóa",
        "quản lý thể dục thể thao"
        ]
    
    let ARR_JOB_5 = [
        "hội họa",
        "đồ họa",
        "điêu khắc",
        "gốm",
        "thiết kế công nghiệp",
        "thiết kế đồ họa",
        "thiết kế thời trang",
        "thiết kế nội thất"
    ]
    
    let ARR_JOB_6 = [
        "kinh tế",
        "kinh tế quốc tế",
        "chính trị học",
        "xây dựng đảng chỉnh quyền và nhà nước",
        "quản lý nhà nước",
        "quan hệ quốc tế",
        "xã hội học",
        "nhân văn",
        "tâm lý học",
        "báo chí",
        "truyền thông đa phương tiện",
        "công nghệ truyền thông",
        "quan hệ công chúng",
        "thông tin học",
        "khoa học thư viện",
        "lưu trữ học",
        "bảo tàng học",
        "xuất bản",
        "kinh doanh xuất bản phẩm"
    ]
    
    let ARR_JOB_7 = [
        "công nghệ sinh học",
        "sinh học",
        "kỹ thuật sinh học",
        "sinh học ứng dụng",
        "thiên văn học",
        "vật lý học",
        "hóa học",
        "khoa học vật liệu",
        "địa chất học",
        "địa lý tự nhiên",
        "khí tượng học",
        "thủy văn học",
        "hải dương học",
        "khoa học môi trường",
        "khoa học đất",
        "toán học",
        "toán ứng dụng",
        "thống kê"
    ]
    
    let ARR_JOB_8 = [
        "quản lý giáo dục",
        "giáo dục học",
        "sư phạm mầm non",
        "giáo dục tiểu học",
        "giáo dục đặc biệt",
        "giáo dục công dân",
        "giáo dục chính trị",
        "giáo dục thể chất",
        "huấn luyện thể thao",
        "giáo dục quốc phòng – an ninh",
        "sư phạm toán học",
        "sư phạm tin học",
        "sư phạm vật lý",
        "sư phạm hóa học",
        "sư phạm sinh học",
        "sư phạm kỹ thuật công nghiệp",
        "sư phạm kỹ thuật nông nghiệp",
        "sư phạm kinh tế gia đình",
        "sư phạm ngữ văn",
        "sư phạm lịch sử",
        "sư phạm địa lý",
        "sư phạm âm nhạc",
        "sư phạm mỹ thuật",
        "sư phạm tiếng Anh",
        "sư phạm tiếng Pháp"
    ]
    
    let ARR_JOB_9 = [
        "khuyến nông",
        "chăn nuôi",
        "khoa học cây trồng",
        "công nghệ rau hoa quả - cảnh quan",
        "kinh doanh nông nghiệp",
        "kinh tế nông nghiệp",
        "phát triển nông thôn"
    ]
    
    var ARR_JOB = [[String]]()
    
    var search_Job_new = [String]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        SearchBar.delegate = self
        // Do any additional setup after loading the view.
        // them cac phan tu vao mang
        ARR_JOB.append(ARR_JOB_0)
        ARR_JOB.append(ARR_JOB_1)
        ARR_JOB.append(ARR_JOB_2)
        ARR_JOB.append(ARR_JOB_3)
        ARR_JOB.append(ARR_JOB_4)
        ARR_JOB.append(ARR_JOB_5)
        ARR_JOB.append(ARR_JOB_6)
        ARR_JOB.append(ARR_JOB_7)
        ARR_JOB.append(ARR_JOB_8)
        ARR_JOB.append(ARR_JOB_9)
        // duyet mang
         t1  = self.Duyet_Nganh()
        print(".........nganh so : \(t1)......\n")
        if(t1 == 0)
        {
            t2 = (ARR_JOB[0].sorted())
        }else if(t1 == 1)
        {
           t2 = (ARR_JOB[1].sorted())
        }else if(t1 == 2)
        {
            t2 = (ARR_JOB[2].sorted())
        }else if(t1 == 3)
        {
            t2 = (ARR_JOB[3].sorted())
        }else if(t1 == 4)
        {
            t2 = (ARR_JOB[4].sorted())
        }else if(t1 == 5)
        {
            t2 = (ARR_JOB[5].sorted())
        }else if(t1 == 6)
        {
            t2 = (ARR_JOB[6].sorted())
        }else if(t1 == 7)
        {
            t2 = (ARR_JOB[7].sorted())
        }else if(t1 == 8)
        {
            t2 = (ARR_JOB[8].sorted())
        }else if(t1 == 9)
        {
            t2 = (ARR_JOB[9].sorted())
        }
        
        // lay ra nghe trong nghanh
 
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
                        // lay ra nghe trong nghanh cua tung cong ty
                            if(item.QL_thongtinTD?.nghanh == timnganh.nghanh)
                            {
                                var nghe_nghanh_ID: get_nghe_nghanh_idCT = get_nghe_nghanh_idCT.init(id_CT: self.congty_hientai.ID_Congty!, nghe: (item.QL_thongtinTD?.vitrituyen)!, nghanh: timnganh.nghanh!)
                                // dua id cong ty va nghe va nganh vao 1 mang
                                self.lay_nghe_nghanh_idcongty.append(nghe_nghanh_ID)
                                
                            }
                          
                        }
                        
                        self.tableView.reloadData()
                        
                    }
                }
            }
            
        })
        

        ///
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let titleView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 25))
        let label:UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 25))
//        label.text = "chua lam "
//        Ng = "Nhóm ngành sản xuất và chế biến"
        label.text = "\(Ng!)"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        titleView.addSubview(label)
        
        self.navigationItem.titleView = titleView
    }
    
    func Duyet_Nganh()-> Int {
        for (index, value) in Array_job_1.enumerated()
        {
            if(value == Ng)
            {
                return index
            }
            print("thu tu la :\(index):....\(value)")
        }
        return 0
    }
    
    func goto_MH_Search_01_01_01()
    {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_Search_01_01_01")
        navigationController?.pushViewController(scr!, animated: true)
    }
    
}

extension MH_Search_01_01_ViewController: UITableViewDataSource,UITableViewDelegate
{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return search_Job_new.count
        }else{
//            return t2.count
            return lay_nghe_nghanh_idcongty.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        if searching {
            cell.textLabel?.text = search_Job_new[indexPath.row]
        }else{
//            cell.textLabel?.text = t2[indexPath.row] as! String
            cell.textLabel?.text = lay_nghe_nghanh_idcongty[indexPath.row].nghe
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                var text = ""
                if searching {
                    text = search_Job_new[indexPath.row]
                }else{
//                    text = t2[indexPath.row]
                    text = lay_nghe_nghanh_idcongty[indexPath.row].nghe!
                }
                JOB = text
        let a:get_nghe_nghanh_idCT = get_nghe_nghanh_idCT.init(id_CT: lay_nghe_nghanh_idcongty[indexPath.row].id_CT!, nghe: lay_nghe_nghanh_idcongty[indexPath.row].nghe!, nghanh: lay_nghe_nghanh_idcongty[indexPath.row].nghanh!)
        tim_nghe_nganh = a
                goto_MH_Search_01_01_01()
    }
}

extension MH_Search_01_01_ViewController: UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search_Job_new = t2.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text  = ""
        tableView.reloadData()
    }
}
