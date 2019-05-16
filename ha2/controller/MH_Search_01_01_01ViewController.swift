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

class MH_Search_01_01_01ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var array_congty:Array<CongTy> = Array<CongTy>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        
        let tablename = ref.child("cong ty ung tuyen")
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
            let congty:CongTy = CongTy(idCT: snapshot.key, tencongty: tencongty, congviec: congviec, diachi: diachi, avatar: avatar, luong: luong, motacongviec: motacongviec, email: email, sdt: sdt)
            if(congviec == JOB)
            {
                self.array_congty.append(congty)
            }
            
            print("........>>>>>>>>>>>>\(self.array_congty.count).................")
            self.tableView.reloadData()
        }
    })
        
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
        return array_congty.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)  as! CELL_Search_01_01_01TableViewCell
        cell.txt_ten.text = array_congty[indexPath.row].tencongty
        cell.txt_dc.text = array_congty[indexPath.row].diachi
        cell.txt_cv.text = array_congty[indexPath.row].congviec
        cell.txt_L.text = array_congty[indexPath.row].luong
        let avatar = array_congty[indexPath.row].avatar
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

        vistor = array_congty[indexPath.row]
        goto_MH_Search_01_01_01_Chitietcongty()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}
