//
//  MH_Taohoso_ViewController.swift
//  ha2
//
//  Created by vuminhtam on 5/3/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class MH_Taohoso_ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    let cellSpacingHeight: CGFloat = 0
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        textView.backgroundColor = UIColor.orange
        textView.layer.borderColor = UIColor.blue.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 8
        textView.clipsToBounds = true
        //
//        tttk = 1
//        tttq = 1
    }


    
    override func viewWillAppear(_ animated: Bool) {
        let titleView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 25))
        let label:UILabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 25))
        label.text = "Tạo Hồ Sơ"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .center
        titleView.addSubview(label)
        tableView.reloadData()
        self.navigationItem.titleView = titleView
    }
    
    func goto_MH_Search_01_01_01_DaCoHoSo_Chitietcongty()
    {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_Search_01_01_01_DaCoHoSo_Chitietcongty")
        navigationController?.pushViewController(scr!, animated: true)
    }
    
    func goto_MH_Thongtintaikhoan()
    {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_Thongtintaikhoan")
        navigationController?.pushViewController(scr!, animated: true)
    }
    
    func goto_MH_Thongtintongquan()
    {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_Thongtintongquan")
        navigationController?.pushViewController(scr!, animated: true)
    }
    
    @IBAction func bt_action_DHS(_ sender: Any) {
        if(tttk == 0 || tttq == 0)
        {
            let alert:UIAlertController = UIAlertController(title: "Vui lòng nhập dữ liệu bắt buộc !", message: "", preferredStyle: .alert)
            let bt:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(bt)
            self.present(alert, animated: true, completion: nil)
        }else{
          
            if(currentUser_1.status_HS == 0)
            {
                let f = chucnang()
                f.set_status_HS_User1()
               self.goto_MH_Search_01_01_01_DaCoHoSo_Chitietcongty()
                let alert:UIAlertController = UIAlertController(title: "Đăng Hồ sơ thành công", message: "", preferredStyle: .alert)
                let bt:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(bt)
                self.present(alert, animated: true, completion: nil)
                
                
            }else{
                let alert:UIAlertController = UIAlertController(title: " Đã tạo hồ sơ rồi !", message: "", preferredStyle: .alert)
                let bt:UIAlertAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(bt)
                self.present(alert, animated: true, completion: nil)
            }

      }
        
    }
    
    @IBAction func bt_action_XTHS(_ sender: Any) {
        let scr = storyboard?.instantiateViewController(withIdentifier: "MH_XemTruocHoSo")
        navigationController?.pushViewController(scr!, animated: true)
    }
    
}

extension MH_Taohoso_ViewController: UITableViewDataSource,UITableViewDelegate
{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0)
        {
            return 4
        }
        return 1
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellID = ""
        if (indexPath.section == 0)
        {
            cellID = CELL1_Taohoso_TableViewCell.CELL1
        }else {
            cellID = CELL2_Taohoso_TableViewCell.CELL2
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)

        if (indexPath.section == 0)
        {
             let a = cell as! CELL1_Taohoso_TableViewCell

            // add border and color
//            a.backgroundColor = UIColor.white
//            a.layer.borderColor = UIColor.black.cgColor
//            a.layer.borderWidth = 1
//            a.layer.cornerRadius = 8
//            a.clipsToBounds = true
            
            if(indexPath.row == 0)
            {
                a.lb_1.text = "Thông tin tài khoản(bắt buộc)"
                if(currentUser_1.status_HS == 1 || tttk == 1)
                {
                    var btnColor = UIButton(type: .custom)
                    
                    btnColor.frame = CGRect(x: CGFloat(a.frame.size.width - 100), y: CGFloat(30), width: CGFloat(50), height: CGFloat(50))
                    btnColor.setBackgroundImage(UIImage(named: "h12.png"), for: [])
                    a.addSubview(btnColor)
                    a.lb_1.text = "Thông tin tài khoản"
                }
            }else  if(indexPath.row == 1)
            {
                a.lb_1.text = "Thông tin tổng quát(bắt buộc)"
                if(currentUser_1.status_HS == 1 || tttq == 1)
                {
                    var btnColor = UIButton(type: .custom)
                    
                    btnColor.frame = CGRect(x: CGFloat(a.frame.size.width - 100), y: CGFloat(30), width: CGFloat(50), height: CGFloat(50))
                    btnColor.setBackgroundImage(UIImage(named: "h12.png"), for: [])
                    a.addSubview(btnColor)
                    a.lb_1.text = "Thông tin tổng quát"
                }
            }else  if(indexPath.row == 2)
            {
                a.lb_1.text = "Kinh nghiệm làm việc"
            }else  if(indexPath.row == 3)
            {
                a.lb_1.text = "Trình độ và Bằng cấp"
            }
           
        }else{
            let a = cell as! CELL2_Taohoso_TableViewCell
            if(currentUser_1.status_HS == 1)
            {
                a.bt_lb.setTitle("Hồ Sơ Đã Đ ng", for: .normal )
            }else{
                a.bt_lb.setTitle("Đăng Hồ Sơ", for: .normal )
            }
            
            a.bt_oulet_Xemtruoc.setTitle("Xem Trước Hồ Sơ", for: .normal)
            a.bt_oulet_Trangchu.setTitle("Trang Chủ", for: .normal)
        }
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0)
        {
            self.goto_MH_Thongtintaikhoan()
        }
        if(indexPath.row == 1)
        {
            self.goto_MH_Thongtintongquan()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section == 0)
        {
            return 100
        }
        return 180
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        if(section == 0)
        {
        let view:UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: 30))
        view.backgroundColor = .clear
//        view.backgroundColor      = UIColor.red
        view.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.75, alpha: 1.0)
        let titleLb               = UILabel(frame: view.bounds)
        titleLb.text              = "Chức năng:"
        titleLb.textAlignment     = .left
        titleLb.font              = UIFont(name: "HelveticaNeue-Bold", size: 20.0)
        titleLb.frame = CGRect(x: 45, y: 5, width: 500, height: 20)
        let img = UIImageView(image: UIImage(named: "h11") )
            img.frame = CGRect(x: 5, y: 5, width: 35, height: 20)
        view.addSubview(titleLb)
        view.addSubview(img)
        return view
        }
        return nil
    }
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
    
}
